import { useBackend } from '../backend';
import { Button, LabeledList, NoticeBox, Section, Stack } from '../components';
import { Window } from '../layouts';

export const CryopodConsole = (props, context) => {
  const { data } = useBackend(context);
  const { account_name } = data;

  const welcomeTitle = `Hello, ${account_name || '[REDACTED]'}!`;

  return (
    <Window title="Cryopod Console" width={400} height={480}>
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item>
            <Section title={welcomeTitle}>
              {
                "This device will store your things until they're needed again."
              }
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <CrewList />
          </Stack.Item>
          <Stack.Item grow>
            <ItemList />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const CrewList = (props, context) => {
  const { data } = useBackend(context);
  const { frozen_crew } = data;

  return (
    frozen_crew.length && (
      <Section
        fill
        scrollable>
        <LabeledList>
          {frozen_crew.map((person, index) => (
            <LabeledList.Item key={index} label={person.name}>
              {person.job}
            </LabeledList.Item>
          ))}
        </LabeledList>
      </Section>
    ) || (
      <NoticeBox>No stored crew!</NoticeBox>
    )
  );
};

const ItemList = (props, context) => {
  const { data, act } = useBackend(context);
  const { item_meta } = data;

  return (
    item_meta.length && (
      <Section
        fill
        scrollable>
        <LabeledList>
          {item_meta.map((metadat) => (
            <LabeledList.Item key={metadat.name} label={metadat.name}>
              <Button onClick={() => {
                act("item", { "item": metadat.ref });
              }}>
                Recover Items
              </Button>
            </LabeledList.Item>
          ))}
        </LabeledList>
      </Section>
    ) || (
      <NoticeBox>No stored items!</NoticeBox>
    )
  );
};
