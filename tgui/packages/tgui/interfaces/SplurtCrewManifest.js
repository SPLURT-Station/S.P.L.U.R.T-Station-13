import { classes } from 'common/react';

import { useBackend } from "../backend";
import { Icon, Section, Table, Tooltip } from "../components";
import { Window } from "../layouts";

const commandJobs = [
  "Head of Personnel",
  "Head of Security",
  "Chief Engineer",
  "Research Director",
  "Chief Medical Officer",
];

export const SplurtCrewManifest = (props, context) => {
  const { data: { manifest } } = useBackend(context);

  return (
    <Window title="Crew Manifest" width={350} height={500}>
      <Window.Content overflow="auto">
        {Object.entries(manifest).map(([dept, crew]) => (
          <Section
            className={"CrewManifest--" + dept}
            key={dept}
            title={dept}
          >
            <Table>
              {Object.entries(crew).map(([crewIndex, crewMember]) => (
                <Table.Row key={crewIndex}>
                  <Table.Cell className={"CrewManifest__Cell"}>
                    {crewMember.name}
                  </Table.Cell>
                  <Table.Cell
                    className={classes([
                      "CrewManifest__Cell",
                      "CrewManifest__Icons",
                    ])}
                    collapsing
                  >
                    {crewMember.rank === "Captain" && (
                      <Tooltip
                        content="Captain"
                        position="bottom"
                      >
                        <Icon
                          className={classes([
                            "CrewManifest__Icon",
                            "CrewManifest__Icon--Command",
                          ])}
                          name="star"
                        />
                      </Tooltip>
                    )}
                    {commandJobs.includes(crewMember.rank) && (
                      <Tooltip
                        content="Member of command"
                        position="bottom"
                      >
                        <Icon
                          className={classes([
                            "CrewManifest__Icon",
                            "CrewManifest__Icon--Command",
                            "CrewManifest__Icon--Chevron",
                          ])}
                          name="chevron-up"
                        />
                      </Tooltip>
                    )}
                  </Table.Cell>
                  <Table.Cell
                    className={classes([
                      "CrewManifest__Cell",
                      "CrewManifest__Cell--Rank",
                    ])}
                    collapsing
                  >
                    {crewMember.rank}
                  </Table.Cell>
                </Table.Row>
              ))}
            </Table>
          </Section>
        ))}
      </Window.Content>
    </Window>
  );
};
