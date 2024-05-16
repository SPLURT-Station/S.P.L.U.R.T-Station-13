import { map, sortBy } from 'common/collections';
import { flow } from 'common/fp';
import { vecLength, vecSubtract } from 'common/vector';

import { useBackend, useSharedState } from '../backend';
import { Box, Button, Flex, Fragment, Icon, LabeledList, NoticeBox, Section, Tabs } from '../components';
import { formatMoney } from '../format';
import { Window } from '../layouts';
import { GenericUplink } from './Uplink';

const coordsToVec = coords => map(parseFloat)(coords.split(', '));

export const SlaveConsole = (props, context) => {
  const { act, data } = useBackend(context);
  const [tab, setTab] = useSharedState(context, 'tab', 1);
  const {
    intercomrecharging,
    cargo_credits,
    credits,
    currentCoords,
    value_table,
  } = data;

  const slaves = flow([
    map((slave, index) => {
      // Calculate distance to the target. BYOND distance is capped to 127,
      // that's why we roll our own calculations here.
      const dist = slave.dist && (
        Math.round(vecLength(vecSubtract(
          coordsToVec(currentCoords),
          coordsToVec(slave.coords))))
      );
      return { ...slave, dist, index };
    }),
    sortBy(
      slave => slave.name), // Sort alphabetically
  ])(data.slaves || []);
  return (
    <Window
      title="Slave Management System"
      width={520}
      height={700}
      theme="syndicate"
      resizable>
      <Window.Content scrollable>
        <Section
          title="Management"
          buttons={(
            <Button
              icon="bullhorn"
              content="Message Station"
              disabled={intercomrecharging}
              onClick={() => act("makePriorityAnnouncement")}
            />
          )}>

          <LabeledList>
            <LabeledList.Item
              label="Our credits">
              {formatMoney(credits, null, true)}cr
            </LabeledList.Item>
            <LabeledList.Item
              label="Station credits">
              {formatMoney(cargo_credits, null, true)}cr
            </LabeledList.Item>
          </LabeledList>
        </Section>

        <Tabs>
          <Tabs.Tab
            icon="link"
            lineHeight="23px"
            selected={tab === 1}
            onClick={() => setTab(1)}>
            Slave Management
          </Tabs.Tab>
          <Tabs.Tab
            icon="shopping-cart"
            lineHeight="23px"
            selected={tab === 2}
            onClick={() => setTab(2)}>
            Supplies
          </Tabs.Tab>
          <Tabs.Tab
            icon="list"
            lineHeight="23px"
            selected={tab === 3}
            onClick={() => setTab(3)}>
            Ransom Table
          </Tabs.Tab>
        </Tabs>
        {tab === 1 && (
          <SlavePanel
            slaves={slaves} />
        )}
        {tab === 2 && (
          <SupplyPanel
            credits={credits} />
        )}
        {tab === 3 && (
          <RansomPanel
            value_table={value_table} />
        )}

      </Window.Content>
    </Window>
  );
};

const SlavePanel = (props, context) => {
  const { slaves } = props;
  const { act } = useBackend(context);
  if (!slaves.length) {
    return (
      <NoticeBox danger>
        No slaves detected in hideout
      </NoticeBox>
    );
  }
  return slaves.map(slave => {
    return (
      <Section
        key={slave.id}
        title={slave.name}
        buttons={(
          <Fragment>
            <Button
              icon="handshake"
              content="Recruit"
              color="blue"
              disabled={slave.dist === undefined
                || !slave.can_recruit
                || slave.bought}
              tooltip="After 15 minutes, unsold slaves can get the offer to join our cause."
              onClick={() => act('recruit', {
                id: slave.id,
              })} />
            <Button
              icon="dolly"
              content="Export"
              color="good"
              disabled={!slave.bought || !slave.in_export_bay}
              tooltip="Send the slave back to the station. First the ransom must be paid by the station, and the slave must be in the export bay."
              onClick={() => act('export', {
                id: slave.id,
              })} />
            <Button
              icon="bolt"
              color="average"
              content="Shock"
              disabled={slave.dist === undefined || slave.shock_cooldown}
              onClick={() => act('shock', {
                id: slave.id,
              })} />
            <Button.Confirm
              icon="unlock"
              content="Release"
              color="bad"
              disabled={slave.dist === undefined}
              tooltip="Remove the slave's collar."
              tooltipPosition="bottom-end"
              onClick={() => act('release', {
                id: slave.id,
              })} />
          </Fragment>
        )}>
        <LabeledList>
          <LabeledList.Item
            label="State"
            color={slave.statstate}>
            {slave.stat}
          </LabeledList.Item>
          <LabeledList.Item
            label="Location">
            {slave.degrees !== undefined && (
              <Icon
                mr={1}
                size={1.2}
                name="arrow-up"
                rotation={slave.degrees} />
            )}
            {slave.dist !== undefined && (
              slave.dist + 'm'
            )}
            {slave.degrees === undefined && (
              <Box color="bad">
                Out of range
              </Box>
            )}
          </LabeledList.Item>
          <LabeledList.Item label="Price">
            {(!slave.station_rank) && (
              <Fragment>
                <Button
                  icon="pencil-alt"
                  content={slave.price ? formatMoney(slave.price, null, true) + "cr" : "Set price"}
                  tooltip="The station will need to pay this."
                  disabled={slave.price_change_cooldown > 0 || slave.bought}
                  onClick={() => act('setPrice', {
                    id: slave.id,
                  })} />
                {(slave.price_change_cooldown > 0 && !slave.bought) && (
                  <Box>
                    (Can be changed in {slave.price_change_cooldown} seconds)
                  </Box>
                )}
              </Fragment>
            )}
            {(slave.station_rank) && (
              formatMoney(slave.price, null, true) + "cr (" + slave.station_rank + ")"
            )}
          </LabeledList.Item>
          <LabeledList.Item
            label="Ransom"
            color={!slave.price
              ? "bad"
              : !slave.bought
                ? 'average'
                : 'good'}
          >
            {!slave.price
              ? "Set the price"
              : !slave.bought
                ? 'Awaiting payment from station'
                : 'Paid; Ready for export'}
          </LabeledList.Item>
        </LabeledList>
      </Section>
    );
  });
};

const SupplyPanel = (props, context) => {
  const { credits } = props;
  return (
    <GenericUplink
      currencyAmount={credits}
      currencySymbol="cr" />
  );
};

const RansomPanel = (props, context) => {
  const { data } = useBackend(context);
  const value_table = props.value_table;
  const { cargo_credits, ransom_scale_value } = data;

  let value_table_converted = [];

  for (const property in value_table) {
    value_table_converted.push({
      rank: `${property}`,
      value: value_table[property],
    });
  }

  return (
    <Fragment>
      <NoticeBox danger>
        Prices are set automatically for the following ranks:
      </NoticeBox>
      <Flex
        direction="column">
        {value_table_converted.map(rank_value => {
          return (
            <Flex
              key={0}
              className="candystripe"
              justify="space-between"
              px="1rem"
              py=".5rem"
            >
              <Flex.Item
                bold>
                {rank_value.rank}
              </Flex.Item>
              <Flex.Item>
                {formatMoney(
                  rank_value.value + (rank_value.value
                    * (cargo_credits / ransom_scale_value))
                  , null, true)}cr
              </Flex.Item>
            </Flex>
          );
        })}
      </Flex>
    </Fragment>
  );
};
