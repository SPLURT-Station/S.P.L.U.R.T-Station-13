/* eslint-disable indent */
import { useBackend } from "../backend";
import { Button, Flex, Icon, Knob, RoundGauge } from "../components";
import { Window } from "../layouts";

type Chastity = {
	power: number;
	minPower: number;
	maxPower: number;
	mode: string;
}

export const ChastityRemote = (_: any, context: any) => {
	const { act, data } = useBackend<Chastity>(context);
	const { power, minPower, maxPower, mode } = data;

	return (
  <Window
    width={350}
    height={200}>

    <Window.Content>
      <RoundGauge
        mt={2.5}
        ml={5}
        ranges={{
					"good": [minPower, maxPower * .5],
					"average": [maxPower * .5, maxPower * .85],
					"bad": [maxPower * .85, maxPower],
        }}
        value={power}
        size={1.85}
        minValue={minPower}
        maxValue={maxPower}
        alertAfter={maxPower * .85}
			/>

      <Flex>
        <Flex.Item>
          <Knob
            ml={5}
            mt={2.5} 
            value={power}
            step={.5}
            size={1.5}
            stepPixelSize={10}
            minValue={minPower}
            maxValue={maxPower}
            onDrag={(_e: any, value: any) => act("change_power", { power: value })}
					/>
        </Flex.Item>
				
        <Flex.Item>
          <Flex ml={10}>
            <Flex.Item>
              <Button
                color={mode === "stimulation" ? "pink" : "default"}
                mr={3}
                fontSize={1.25}
                onClick={() => act("change_mode", { mode: "stimulation" })}
						>
                Stimulate
              </Button>

              <Button
                color={mode === "shock" ? "red" : "default"}
                fontSize={1.25}
                onClick={() => act("change_mode", { mode: "shock" })}
						>
                Shock
              </Button>
            </Flex.Item>
          </Flex>
					
          <Button
            color="green"
            ml={15}
            mt={2}
            mb={5}
            fontSize={1.25}
            onClick={() => act("activate")}
						>
            Activate
            <Icon name="plus" ml={1} />
          </Button>
        </Flex.Item>
      </Flex>

    </Window.Content>
  </Window>
	);
};
