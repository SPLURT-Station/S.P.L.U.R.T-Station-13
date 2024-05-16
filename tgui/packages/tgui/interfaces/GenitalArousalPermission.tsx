/* eslint-disable indent */
import { useBackend } from "../backend";
import { Box, Button, Flex, Section, Tooltip } from "../components";
import { Window } from "../layouts";

type ChastityHypno = {
	genitals: []
}

const getTooltip = (mod: string) => {
	switch (mod) {
		case "None":
			return "Genital behaves normally.";
		case "Impotent":
			return "Genital produces no arousal.";
		case "Edging-Only":
			return "Genital produces 0.5x arousal and cannot raise above 80% of orgasm arousal.";
		case "Disappointing-Orgasm":
			return "Genital produces 0.75x arousal and produces 0.5x fluid.";
		case "Overstimulated":
			return "Genital produces 1.8x arousal.";
		case "Hyper-Sensitive":
			return "Genital produces 3x arousal.";
		default:
			return "...";
	}
};

export const GenitalArousalPermission = (_: any, context: any) => {
	const { act, data } = useBackend<ChastityHypno>(context);
	const { genitals } = data;
	return (
  <Window
    width={300}
    height={350}>

    <Window.Content>
      <Section fill>
        <Flex direction="column" align="center">
          {
					Object.keys(genitals).map((G) => (
  <Flex.Item key={G}>
    <Flex.Item textAlign="center" fontSize={1.25}>
      <b>{G}</b>
    </Flex.Item>
    <Flex mt={.5} mb={3}>
      <Button
        color="default"
        icon="arrow-left"
        onClick={() => act("change_mode", { genital: G, direction: "left" })}
								/>
      <Tooltip position="top" content={getTooltip(genitals[G])}>
        <Box textAlign="center" width={13}>{genitals[G]}</Box>
      </Tooltip>
      <Button
        color="default"
        icon="arrow-right"
        onClick={() => act("change_mode", { genital: G, direction: "right" })}
								/>
    </Flex>
  </Flex.Item>
					))
					}

          <Flex.Item>
            <Button
              mt={1}
              color="green"
              onClick={() => act("save")}
              align="center"
              content="Save"
              icon="check"
              fontSize={1.4}
						/>
          </Flex.Item>
        </Flex>
      </Section>
						
    </Window.Content>

  </Window>
	);
};