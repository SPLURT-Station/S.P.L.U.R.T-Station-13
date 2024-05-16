import { useBackend } from '../backend';
import { Blink, Box, Button, Section, Slider } from '../components';
import { Window } from '../layouts';

export const Telesci = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    telepad,
    inserted_gps,
    temp_msg,
    rotation,
    angle,
    z_coord,
    power_possible,
    crystals,
  } = data;
  const last_tele_data = data.last_tele_data || [];
  return (
    <Window
      width={300}
      height={550}>
      <Window.Content>
        <Section>
          {!telepad && (
            <Box backgroundColor="#4972a1" p="2px">
              <Box color="bad" backgroundColor="black">
                No telepad located.<br />
                Please add telepad data.<Blink>▍</Blink>
              </Box>
            </Box>
          ) || (
            <Section>
              <Box backgroundColor="#4972a1" p="2px">
                <Box color="green" backgroundColor="black" pb="15px">
                  {temp_msg.map(message => (
                    <div key={message}>
                      {message}
                    </div>
                  ))}
                </Box>
              </Box>
              <Section title="Set Bearing">
                <Slider
                  key="rotationValue"
                  unit="°"
                  value={rotation}
                  step={1}
                  stepPixelSize={25}
                  minValue={-900}
                  maxValue={900}
                  onDrag={(e, value) => act('setRotation', {
                    ref: value,
                  })} />
              </Section>
              <Section title="Set Elevation">
                <Slider
                  key="angleValue"
                  unit="°"
                  value={angle}
                  step={1}
                  stepPixelSize={25}
                  minValue={1}
                  maxValue={90}
                  onDrag={(e, value) => act('setAngle', {
                    ref: value,
                  })} />
              </Section>
              <Section title="Set Power">
                {power_possible.map(power_choice => (
                  <Button
                    key={power_choice[0]}
                    content={power_choice[0]}
                    color={power_choice[1] === 2 ? "green" : power_choice[1] ? "default" : "red"}
                    onClick={() => act('set_power', {
                      power: power_choice[0],
                    })} />
                ))}
              </Section>
              <Section title="Set Sector">
                <Slider
                  key="sectorValue"
                  unit=""
                  value={z_coord}
                  step={1}
                  stepPixelSize={25}
                  minValue={1}
                  maxValue={10}
                  onDrag={(e, value) => act('setSector', {
                    ref: value,
                  })} />
              </Section>
              <Section title="Extra Functions">
                <Button
                  content="Send"
                  icon="paper-plane"
                  onClick={() => act('send')}
                />
                <Button
                  content="Receive"
                  icon="undo"
                  onClick={() => act('receive')}
                /><br />
                <Button
                  content="Recalibrate Crystals"
                  icon="sync"
                  onClick={() => act('recalibrate')}
                /><br />
                <Button
                  content="Eject Crystals"
                  icon="eject"
                  disabled={!crystals}
                  onClick={() => act('eject')}
                />
                <Button
                  content="Eject GPS"
                  icon="eject"
                  disabled={!inserted_gps}
                  onClick={() => act('eject_gps')} />
              </Section>
              <Box backgroundColor="#4972a1" p="2px">
                <Box color="green" backgroundColor="black" pb="15px">
                  Last teleportation data:<br />
                  {last_tele_data.length ? last_tele_data.map(line => (
                    <div key={line}>
                      {line}<br />
                    </div>
                  )) : "No teleport data found."}
                </Box>
              </Box>
            </Section>
          )}
        </Section>
      </Window.Content>
    </Window>
  );
};
