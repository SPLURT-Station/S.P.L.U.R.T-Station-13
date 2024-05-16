import { useBackend } from '../backend';
import { Box, Button, ColorBox, Fragment, LabeledList, Section } from '../components';
import { Window } from '../layouts';

export const centcomCommunications = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    messages = [],
    command_name,
    time,
  } = data;

  // Convert world.time into an integer of minutes.
  let worldTimeToMinutes = function (time) {
    return Math.floor(time / 600);
  };

  let colour_centcom = "#FFA500";
  let colour_syndicate = "#DC143C";

  return (
    <Window
      width={600}
      height={700}
    >
      <Window.Content>
        <Section
          title="Message log"
          buttons={(
            <Button
              px="1rem"
              onClick={() => act('send_command_report')}
            >
              New Command report
            </Button>
          )}
        >
          <Box py=".5rem">
            <LabeledList>

              <LabeledList.Item label="Command name">
                <Button
                  px="1rem"
                  icon="pen"
                  onClick={() => act('set_command_name')}
                >{command_name}
                </Button>
                <Button
                  icon="undo"
                  px=".75rem"
                  tooltip="Reset to default"
                  onClick={() => act('reset_command_name')}
                />
              </LabeledList.Item>

              <LabeledList.Item label="Colours">
                <Fragment>
                  <ColorBox
                    color={colour_centcom} />
                  <Box inline px="1rem">admin</Box>
                  <ColorBox
                    color={colour_syndicate} />
                  <Box inline px="1rem">emagged (to Syndicate)</Box>
                </Fragment>
              </LabeledList.Item>

            </LabeledList>
          </Box>
        </Section>

        {/* Reverse to show newer messages first. */}
        {messages.reverse().map((message, i) => {

          let title = message.sender_name;
          if (message.sender_job) {
            title += " (" + message.sender_job + ")";
          }

          return (
            <Section
              key={i}
              title={title}
              color={message.id ? (message.was_emagged ? colour_syndicate : "") : colour_centcom}
              buttons={(
                <Fragment>

                  <Button
                    color="transparent"
                    tooltip="Message age"
                    px="1rem"
                  >
                    {worldTimeToMinutes(time - message.time_sent)}m
                  </Button>

                  {!!message.id && (
                    <Button
                      icon="ghost"
                      tooltip="Orbit sender"
                      px="1rem"
                      onClick={() => act('orbit_sender', {
                        sender_ckey: message.sender_ckey,
                      })}
                    />

                  )}

                  {message.id && (
                    <Button
                      icon="check"
                      color="green"
                      px="1rem"
                      tooltip={message.handled ? "Marked as resolved" : "Mark as resolved"}
                      tooltipPosition="bottom-end"
                      disabled={message.handled}
                      onClick={() => act('mark_message', {
                        message_id: message.id,
                      })}
                    >{message.handled ? "" : "Resolve"}
                    </Button>
                  )}
                </Fragment>
              )}
            >
              <Box py=".5rem">{message.message}</Box>

            </Section>
          );
        })}
      </Window.Content>
    </Window>
  );
};
