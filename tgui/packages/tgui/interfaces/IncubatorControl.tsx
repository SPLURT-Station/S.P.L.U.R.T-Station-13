import { Window } from '../layouts';
import { Button, Table, Section, ProgressBar } from '../components';
import { useBackend } from '../backend';

type IncubatorData = {
  eggs: EggsData[],
  is_on: boolean,
}

type EggsData = {
  name: String,
  ref: String,
  progress: number,
}

export const IncubatorControl = (props, context) => {
  const { act, data } = useBackend<IncubatorData>(context);
  const { is_on, eggs } = data;

  return (
    <Window
      width={450}
      height={600}
      theme="hotpink"
      resizable>
      <Window.Content overflow="auto">
        <Section title="Incubator" buttons={(
          <Button
            icon="power-off"
            selected={is_on}
            onClick={
              () => act("toggle_power")
            }
          />
        )}>
          <Table>
            {eggs.map(
              egg => {
                <EggRow
                  key={egg.ref}
                  name={egg.name}
                  progress={egg.progress}
                  ref={egg.ref}
                />
              }
            )
            }
          </Table>
        </Section>
      </Window.Content>
    </Window>
  )
}

const EggRow = (props, context) => {
  const { act, data } = useBackend<IncubatorData>(context);
  const {
    name,
    progress,
    ref
  } = props;
  return (
    <Table.Row className="candystripe">
      <Table.Cell bold>
        {name}
      </Table.Cell>
      <Table.Cell>
        <ProgressBar value={progress} />
      </Table.Cell>
      <Table.Cell>
        <Button onClick={() => {
          act("remove", { ref: ref })
        }}>
          Remove
        </Button>
      </Table.Cell>
    </Table.Row>
  )
}

