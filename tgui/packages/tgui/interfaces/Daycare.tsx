import { useBackend } from '../backend';
import { Stack, Section, ByondUi } from '../components';
import { Window } from '../layouts';

export const Daycare = (props, context) => {

  return (
    <Window
      title="Honeystone's Genetic Daycare"
      width={920}
      height={770}>
      <Section>
        <Stack>
          <Stack.Item grow>
            <ByondUi
              width="220px"
              height="100%"
              params={{
                id: props.id,
                type: 'map',
              }}
            />
          </Stack.Item>
          <Stack.Item>
            <Prefs />
          </Stack.Item>


        </Stack>
      </Section>
    </Window>
  )
}

const Prefs = (props, context) => {
  return (
    <Stack>
      Prefs

    </Stack>
  )
}
