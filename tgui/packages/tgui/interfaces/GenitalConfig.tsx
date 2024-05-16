
import { filter } from 'common/collections';
import { flow } from 'common/fp';
import { createSearch } from 'common/string';

import { useBackend, useLocalState } from '../backend';
import { Button, Input, NumberInput, ProgressBar, Section, Stack, Table, Tabs } from '../components';
import { Window } from '../layouts';


type GenitalInfo = {
  istargetself: boolean,
  target_name: String,
  genitals: GenitalData[];
}

type GenitalData = {
  img: string,
  name: string,
  key: string,
  description: string,
  visibility: string,
  extras: string,
  extra_choices: string[],
  possible_choices: string[],
  can_arouse: boolean,
  arousal_state: boolean,
  fluid: number,
  possible_equipment_choices: string[],
  min_size: number,
  max_size: number,
  equipments: Equipment[],
}

type Equipment = {
  name: string,
  key: string,
}

export const GenitalConfig = (props, context) => {
  const { act, data } = useBackend<GenitalInfo>(context);
  const genitals = data.genitals || [];
  const [tabIndex, setTabIndex] = useLocalState(context, 'tabIndex', 0);
  return (
    <Window
      width={850}
      height={600}
      theme="hotpink"
      resizable>
      <Window.Content scrollable={false}>
        {data.target_name ? (
          <Section>
            Interacting with <b>{data.target_name}</b>
          </Section>
        ) : null}
        {genitals.length ? (
          <>
            <Section title="Genital">
              <Stack vertical>
                <Stack.Item>
                  <Tabs fluid textAlign="center">
                    {genitals.map((genital, index) => (
                      <Tabs.Tab
                        key={index}
                        selected={tabIndex === index}
                        onClick={() => setTabIndex(index)}
                      >
                        {genital.name}
                      </Tabs.Tab>
                    ))}
                  </Tabs>
                </Stack.Item>
                <Stack.Item>
                  {genitals[tabIndex].description}
                </Stack.Item>
              </Stack>
            </Section>
            <Section title="Settings">
              <Stack grow>
                <Stack.Item grow>
                  <Stack vertical>
                    <Stack.Item>
                      <Section>
                        Fluid level:
                        <ProgressBar
                          key={genitals[tabIndex].key}
                          value={
                            genitals[tabIndex].fluid
                              ? genitals[tabIndex].fluid
                              : 0.0
                          }
                          color="white"
                        />
                      </Section>
                    </Stack.Item>
                    {data.istargetself
                      ? <SelfConfig /> : null}
                  </Stack>
                </Stack.Item>
              </Stack>
            </Section>
            <Section
              title="Items Inserted"
              buttons={(
                <Button
                  fluid
                  content="Insert Item"
                  onClick={() => act('equipment', {
                    genital: genitals[tabIndex].key,
                    equipment_action: "insert",
                  })}
                />
              )}
            >
              <Equipments />
            </Section>
          </>
        ) : (
          <Section align="center">
            {data.target_name ? "They" : "You"} don&apos;t seem to have any genitals...
            Or any that you could interact with.
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};

const SelfConfig = (props, context) => {
  const [tabIndex] = useLocalState(context, 'tabIndex', 0);
  const { act, data } = useBackend<GenitalInfo>(context);
  const genital = data.genitals[tabIndex];
  return (
    <Stack.Item>
      <Stack grow>
        {genital.img ? (
          <Stack.Item>
            <img
              src={`data:image/jpeg;base64,${genital.img}`}
              style={{
                'vertical-align': 'middle',
                'horizontal-align': 'middle',
              }} />
          </Stack.Item>
        ) : null}
        {typeof genital.max_size === "number" ? (
          <Stack.Item>
            <SizeButtons />
          </Stack.Item>
        ) : null}
        <Stack.Item grow>
          <ToggleSettings />
        </Stack.Item>
      </Stack>
    </Stack.Item>
  );
};

const SizeButtons = (props, context) => {
  const [tabIndex] = useLocalState(context, 'tabIndex', 0);
  const { act, data } = useBackend<GenitalInfo>(context);
  const genital = data.genitals[tabIndex];
  return (
    <Section>
      <Stack>
        <Stack.Item>
          <Stack vertical>
            Max growth:
            <NumberInput
              value={genital.max_size}
              onChange={(e, value) => act('genital', {
                genital: genital.key,
                max_size: value,
              }
              )}
            />
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Stack vertical>
            Min shrink:
            <NumberInput
              value={genital.min_size}
              onChange={(e, value) => act('genital', {
                genital: genital.key,
                min_size: value,
              }
              )}
            />
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const ModeToIcon = {
  "Always visible": "eye",
  "Hidden by clothes": "tshirt",
  "Hidden by underwear": "low-vision",
  "Always hidden": "eye-slash",
  "Allows egg stuffing": "egg",
};

const ToggleSettings = (props, context) => {
  const [tabIndex] = useLocalState(context, 'tabIndex', 0);
  const { act, data } = useBackend<GenitalInfo>(context);
  const genital = data.genitals[tabIndex];
  return (
    <Stack grow>
      {genital.possible_choices.map(choice => (
        <Stack.Item key={choice} grow>
          <Button
            textAlign="center"
            key={choice}
            tooltip={choice}
            icon={ModeToIcon[choice]}
            color={genital.visibility === choice ? "green" : "default"}
            onClick={() => act('genital', {
              genital: genital.key,
              visibility: choice,
            })}
            fluid
          />
        </Stack.Item>
      ))}
      <Stack.Item grow>
        <Button
          textAlign="center"
          key={genital.arousal_state}
          tooltip={genital.can_arouse
            ? ((genital.arousal_state ? "Unarouse" : "Arouse") + " your " + genital.name.toLowerCase())
            : "You cannot modify arousal on your " + genital.name.toLowerCase()}
          icon="heart"
          color={genital.can_arouse ? (genital.arousal_state ? "green" : "default") : "grey"}
          onClick={() => act('genital', {
            genital: genital.key,
            set_arousal: !genital.arousal_state,
          })}
          fluid
        />
      </Stack.Item>
      {genital.extra_choices instanceof Array
        ? genital.extra_choices.map(choice => (
          <Stack.Item key={choice} grow>
            <Button
              textAlign="center"
              key={choice}
              tooltip={choice}
              icon={ModeToIcon[choice]}
              color={genital.extras === choice ? "green" : "default"}
              onClick={() => act('genital', {
                genital: genital.key,
                visibility: choice,
              })}
              fluid
            />
          </Stack.Item>
        )) : null}
    </Stack>
  );
};

const Equipments = (props, context) => {
  const [tabIndex] = useLocalState(context, 'tabIndex', 0);
  const { act, data } = useBackend<GenitalInfo>(context);
  const genital = data.genitals[tabIndex];
  const [searchText, setSearchText] = useLocalState(context, 'searchText', '');
  const items = prepareSearch(genital.equipments, searchText) || [];
  return (
    <Stack vertical>
      <Stack.Item>
        <Input
          fluid
          placeholder="Search for items.."
          onInput={(e, value) => setSearchText(value)}
        />
      </Stack.Item>
      <Stack.Item>
        <Table mb={1}>
          {items.map((item, index) =>
            (
              <Table.Row key={index} className="candystripe">
                <Table.Cell bold>
                  {item.name}
                </Table.Cell>
                <Table.Cell collapsing textAlign="center">
                  <Button
                    fluid
                    content="Remove"
                    onClick={() => act('equipment', {
                      equipment: item.key,
                      genital: genital.key,
                      equipment_action: "remove",
                    })}
                  />
                </Table.Cell>
              </Table.Row>
            )
          )}
        </Table>
      </Stack.Item>
    </Stack>
  );
};

export const prepareSearch = (items, searchText = '') => {
  const testSearch = createSearch<Equipment>(searchText,
    item => item.name);
  return flow([
    // Optional search term
    searchText && filter(testSearch),
  ])(items);
};
