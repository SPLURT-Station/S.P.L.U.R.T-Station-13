/* eslint-disable max-len */
import { Fragment } from 'inferno';
import { useBackend, useLocalState } from "../backend";
import { Box, Button, Flex, Collapsible, Icon, LabeledList, NoticeBox, Section, Tabs, ProgressBar } from "../components";
import { Window } from "../layouts";

export const GenitalsPanel = (props, context) => {
  const { act, data } = useBackend(context);

  return (
    <Window width={700} height={660} theme="abstract" resizable>
      <Window.Content overflow="auto">
        {data.unsaved_changes && (
          <NoticeBox danger>
            <Flex>
              <Flex.Item basis="90%">
                Warning: Unsaved Changes!
              </Flex.Item>
              <Flex.Item>
                <Button
                  content="Save Prefs"
                  icon="save"
                  onClick={() => act("saveprefs")} />
              </Flex.Item>
            </Flex>
          </NoticeBox>
        ) || null}
        <GenitalsSelectionAndCustomization />
        <GenitalsUserPreferences />
      </Window.Content>
    </Window>
  );
};

const GenitalsSelectionAndCustomization = (props, context) => {
  const { act, data } = useBackend(context);
  const { genitals, selected } = data;

  return (
    <Section title="My Genitals">
      <Tabs>
        {genitals.map(genital => {
          const color = genital.active ? `#${genital.color}` : "gray";
          return (
            <Tabs.Tab
              key={genital.type}
              selected={genital.selected}
              textColor={color}
              onClick={() => act("genitalpick", { genitalpick: genital.type })}>
              <Box inline textColor={genital.selected && color || null}>
                {genital.name}
              </Box>
            </Tabs.Tab>
          );
        })}
      </Tabs>
      {selected && <GenitalsSelectedGenital genital={selected} />}
    </Section>
  );
};

const GenitalsSelectedGenital = (props, context) => {
  const { act } = useBackend(context);
  const { genital } = props;

  if (!genital.active) {
    return (
      <LabeledList>
        <LabeledList.Item label="Has genital">
          <Button
            onClick={() => act("changeattr", { attr: "active" })}
            content={genital.active ? "Yes" : "No"} />
        </LabeledList.Item>
      </LabeledList>
    );
  }

  // TODO: would be nice to have a color to color button
  return (
    <LabeledList>
      <LabeledList.Item label="Has genital">
        <Button
          onClick={() => act("changeattr", { attr: "active" })}
          content={genital.active ? "Yes" : "No"} />
      </LabeledList.Item>
      {genital.color && (
        <LabeledList.Item label="Color">
          <Button
            onClick={() => act("changeattr", { attr: "color" })}
            content={`#${genital.color}`} />
        </LabeledList.Item>)}
      {genital.visibility && (
        <LabeledList.Item label="Visibility">
          <Button
            onClick={() => act("changeattr", { attr: "visibility" })}
            content={genital.visibility} />
        </LabeledList.Item>)}
      {genital.stuffing !== undefined && (
        <LabeledList.Item label="Egg Stuffing">
          <Button
            onClick={() => act("changeattr", { attr: "stuffing" })}
            content={genital.stuffing ? "Yes" : "No"} />
        </LabeledList.Item>)}
      {genital.growth_min !== undefined && (
        <LabeledList.Item label="Shrink cap (min.)">
          <Button
            onClick={() => act("changeattr", { attr: "growth_min" })}
            content={genital.growth_min} />
        </LabeledList.Item>)}
      {genital.growth_max !== undefined && (
        <LabeledList.Item label="Growth cap (max.)">
          <Button
            onClick={() => act("changeattr", { attr: "growth_max" })}
            content={genital.growth_max} />
        </LabeledList.Item>)}
      {genital.shape && (
        <LabeledList.Item label="Shape">
          <Button
            onClick={() => act("changeattr", { attr: "shape" })}
            content={genital.shape} />
        </LabeledList.Item>)}
      {genital.size && (
        <LabeledList.Item label="Size">
          <Button
            onClick={() => act("changeattr", { attr: "size" })}
            content={genital.size} />
        </LabeledList.Item>)}
      {genital["length"] && (
        <LabeledList.Item label="Length">
          <Button
            onClick={() => act("changeattr", { attr: "length" })}
            content={genital["length"]} />
        </LabeledList.Item>)}
      {genital.diameter_ratio && (
        <LabeledList.Item label="Diameter Ratio">
          <Button
            onClick={() => act("changeattr", { attr: "diameter_ratio" })}
            content={genital.diameter_ratio} />
        </LabeledList.Item>)}
      {genital.womb !== undefined && (
        <LabeledList.Item label="Womb">
          <Button
            onClick={() => act("changeattr", { attr: "womb" })}
            content={genital.womb ? "Yes" : "No"} />
        </LabeledList.Item>)}
      {genital.producing !== undefined && (
        <LabeledList.Item label="Lactating">
          <Button
            onClick={() => act("changeattr", { attr: "producing" })}
            content={genital.producing ? "Yes" : "No"} />
        </LabeledList.Item>)}
      {(genital.fluid && (genital.type !== "breasts" || genital.producing === true) && (genital.type !== "vag" || genital.womb === true)) && (
        <LabeledList.Item label="Fluid">
          <Button
            onClick={() => act("changeattr", { attr: "fluid" })}
            content={genital.fluid_name ?? "Nothing?"} />
        </LabeledList.Item>)}
      {genital.volume && (
        <LabeledList.Item label="Fluid Volume">
          <ProgressBar value={genital.volume} maxValue={genital.max_volume} />
        </LabeledList.Item>)}
      <LabeledList.Item label="Equipment">
        {genital.equipment.length === 0
          ? <Button content={"None"} />
          // eslint-disable-next-line react/no-danger
          : genital.equipment.map((e, i) => <Button key={i} style={{ lineHeight: "3em", textAlign: "center", paddingRight: 4 }} dangerouslySetInnerHTML={{ __html: e }} />)}
      </LabeledList.Item>
    </LabeledList>
  );
};
const GenitalsUserPreferences = (props, context) => {
  const { act, data } = useBackend(context);

  return (
    <Section title="Preferences">
      <Section>
        <Flex spacing={1}>
          <Flex.Item basis="100%">
            <Button
              fluid
              content="Save Prefs"
              icon="save"
              onClick={() => act("saveprefs")} />
          </Flex.Item>
        </Flex>
      </Section>
    </Section>
  );
};
