import { useBackend } from '../backend';
import { Stack, Section, ByondUi } from '../components';
import { Window } from '../layouts';

type DaycareData = {
  image: String,
}

export const Daycare = (props, context) => {

  const { act, data } = useBackend<DaycareData>(context);
  return (
    <Window
      title="Honeystone's Genetic Daycare"
      width={920}
      height={770}>
      <Section>
        <Stack>
          <Stack.Item grow>
            {
              data ?
                <img
                  src={`data:image/jpeg;base64,${data.image}`}
                  style={{
                    'vertical-align': 'middle',
                    'horizontal-align': 'middle',
                  }} />
                : "Insert Egg"
            }
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
