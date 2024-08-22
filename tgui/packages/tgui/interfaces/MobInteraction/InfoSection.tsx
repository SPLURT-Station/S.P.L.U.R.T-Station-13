import { useBackend } from '../../backend';
import { BlockQuote, Button, Icon, ProgressBar, Section, Stack, Slider, Tooltip } from '../../components';

type HeaderInfo = {
  isTargetSelf: boolean;
  interactingWith: string;
  lust: number;
  maxLust: number;
  selfAttributes: string[];
  theirAttributes: string[];
  theirLust: number;
  theirMaxLust: number;

  // Arousal prefs stuff
  use_arousal_multiplier: boolean;
  arousal_multiplier: number;
  use_moaning_multiplier: boolean;
  moaning_multiplier: number;
}

export const InfoSection = (props, context) => {
  const { act, data } = useBackend<HeaderInfo>(context);
  const {
    isTargetSelf,
    interactingWith,
    lust,
    maxLust,
    selfAttributes,
    theirAttributes,
    theirLust,
    theirMaxLust,

    // Arousal prefs stuff
    use_arousal_multiplier,
    arousal_multiplier,
    use_moaning_multiplier,
    moaning_multiplier,
  } = data;
  return (
    <Section title={interactingWith} fill>
      <Stack vertical fill>
        <Stack.Item grow basis={0}>
          <Section fill overflow="auto">
            <Stack>
              <Stack.Item>
                <BlockQuote>
                  You...<br />
                  {selfAttributes.map(attribute => (
                    <div key={attribute}>
                      {attribute}<br />
                    </div>
                  ))}
                </BlockQuote>
              </Stack.Item>
              {!isTargetSelf ? (
                <Stack.Item>
                  <BlockQuote>
                    They...<br />
                    {theirAttributes.map(attribute => (
                      <div key={attribute}>
                        {attribute}<br />
                      </div>
                    ))}
                  </BlockQuote>
                </Stack.Item>
              ) : (null)}
            </Stack>
          </Section>
        </Stack.Item>
        <Stack.Item>
          <Stack fill>
            <Stack.Item grow>
              <ProgressBar fill value={lust} maxValue={maxLust} color="purple"><Icon name="heart" /></ProgressBar>
            </Stack.Item>
            {(!isTargetSelf && (theirLust !== null) ? (
              <Stack.Item grow>
                <ProgressBar value={theirLust} maxValue={theirMaxLust} color="purple"><Icon name="heart" /></ProgressBar>
              </Stack.Item>
            ) : (null))}
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Stack fill>
            <Stack.Item grow basis={0}>
              <Stack>
                <Stack.Item grow>
                  <Button
                    fluid
                    mb={-0.7}
                    content={use_arousal_multiplier ? "" : "Custom lust gain"}
                    tooltip={`${use_arousal_multiplier ? "Disable" : "Enable"} lust gain multiplier`}
                    icon={use_arousal_multiplier ? "toggle-on" : "toggle-off"}
                    selected={use_arousal_multiplier}
                    onClick={() => act('pref', {
                      pref: 'use_arousal_multiplier',
                    })}
                  />
                </Stack.Item>

                {(!!use_arousal_multiplier && (
                  <Stack.Item grow basis={90}>
                    <Tooltip content="Arousal Multiplier">
                      <Slider
                        minValue={0}
                        maxValue={300}
                        stepPixelSize={3}
                        value={arousal_multiplier}
                        unit="%"
                        ranges={{
                          bad: [-Infinity, 75],
                          good: [76, 125],
                          average: [126, Infinity],
                        }}
                        onChange={(_, value) => act("pref", { pref: 'arousal_multiplier', amount: value })}
                      />
                    </Tooltip>
                  </Stack.Item>
                ))}
              </Stack>
            </Stack.Item>

            <Stack.Item grow basis={0}>
              <Stack>
                <Stack.Item grow>
                  <Button
                    fluid
                    mb={-0.7}
                    content={use_moaning_multiplier ? "" : "Custom moaning chance"}
                    tooltip={`${use_moaning_multiplier ? "Disable" : "Enable"} moaning chance customizaton`}
                    icon={use_moaning_multiplier ? "toggle-on" : "toggle-off"}
                    selected={use_moaning_multiplier}
                    onClick={() => act('pref', {
                      pref: 'use_moaning_multiplier',
                    })}
                  />
                </Stack.Item>
                {(!!use_moaning_multiplier && (
                  <Stack.Item grow basis={90}>
                    <Tooltip content="Moaning chance">
                      <Slider
                        minValue={0}
                        maxValue={100}
                        step={1}
                        value={moaning_multiplier}
                        unit="%"
                        onChange={(_, value) => act("pref", { pref: 'moaning_multiplier', amount: value })}
                      />
                    </Tooltip>
                  </Stack.Item>
                ))}
              </Stack>
            </Stack.Item>
          </Stack>
        </Stack.Item>

      </Stack>
    </Section>
  );
};
