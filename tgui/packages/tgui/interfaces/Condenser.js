import { useBackend } from '../backend';
import { Button, LabeledList, NumberInput, Section } from '../components';
import { Window } from '../layouts';

export const Condenser = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window
      width={335}
      height={115}>
      <Window.Content>
        <Section>
          <LabeledList>
            <LabeledList.Item label="Condenser">
              <Button
                icon={data.on ? 'power-off' : 'times'}
                content={data.on ? 'On' : 'Off'}
                selected={data.on}
                onClick={() => act('condenser')} />
            </LabeledList.Item>

            <LabeledList.Item label="Maximum Size Penis">
                <NumberInput
                  animated
                  value={parseFloat(data.wanted_size_p)}
                  unit="inches"
                  width="75px"
                  minValue={0}
                  maxValue={30}
                  step={10}
                  onChange={(e, value) => act('size_p', {
                    size_p: value,
                  })} />
              </LabeledList.Item>

              <LabeledList.Item label="Maximum Size Testicles">
                <NumberInput
                  animated
                  value={parseFloat(data.wanted_size_t)}
                  unit="inches"
                  width="75px"
                  minValue={0}
                  maxValue={5}
                  step={10}
                  onChange={(e, value) => act('size_t', {
                    size_t: value,
                  })} />
              </LabeledList.Item>

              <LabeledList.Item label="Maximum Size Breasts">
                <NumberInput
                  animated
                  value={parseFloat(data.wanted_size_b)}
                  unit="inches"
                  width="75px"
                  minValue={0}
                  maxValue={30}
                  step={10}
                  onChange={(e, value) => act('size_b', {
                    size_b: value,
                  })} />
              </LabeledList.Item>

          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};

