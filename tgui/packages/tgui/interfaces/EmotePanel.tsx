import { BooleanLike } from '../../common/react';
import { capitalize } from '../../common/string';
import { useLocalState } from '../backend';
import { useBackend } from '../backend';
import { Box, Button, Flex, Icon, Section } from '../components';
import { Window } from '../layouts';
import { SearchBar } from './common/SearchBar';

type Emote = {
  key: string;
  name: string;
  hands: BooleanLike;
  visible: BooleanLike;
  audible: BooleanLike;
  sound: BooleanLike;
  use_params: BooleanLike;
};

type EmotePanelData = {
  emotes: Emote[];
};

export const EmotePanelContent = (props, context) => {
  const { act, data } = useBackend<EmotePanelData>(context);
  const { emotes } = data;

  const [filterVisible, toggleVisualFilter] = useLocalState(context, 'filterVisible', false);
  const [filterAudible, toggleAudibleFilter] = useLocalState(context, 'filterAudible', false);
  const [filterSound, toggleSoundFilter] = useLocalState(context, 'filterSound', false);
  const [filterHands, toggleHandsFilter] = useLocalState(context, 'filterHands', false);
  const [filterUseParams, toggleUseParamsFilter] = useLocalState(context, 'filterUseParams', false);
  const [useParams, toggleUseParams] = useLocalState(context, 'useParams', false);
  const [searchText, setSearchText] = useLocalState(context, 'searchText', '');
  const [showNames, toggleShowNames] = useLocalState(context, 'showNames', true);
  const [showIcons, toggleShowIcons] = useLocalState(context, 'showIcons', false);

  return (
    <Section>
      <Section
        title="Filters"
        buttons={
          <Flex>
            <Button
              icon="eye"
              width="100%"
              height="100%"
              align="center"
              tooltip="Visible"
              selected={filterVisible}
              onClick={() => toggleVisualFilter(!filterVisible)}
            />
            <Button
              icon="comment"
              width="100%"
              height="100%"
              align="center"
              tooltip="Audible"
              selected={filterAudible}
              onClick={() => toggleAudibleFilter(!filterAudible)}
            />
            <Button
              icon="volume-up"
              width="100%"
              height="100%"
              align="center"
              tooltip="Sound"
              selected={filterSound}
              onClick={() => toggleSoundFilter(!filterSound)}
            />
            <Button
              icon="hand-paper"
              width="100%"
              height="100%"
              align="center"
              tooltip="Hands"
              selected={filterHands}
              onClick={() => toggleHandsFilter(!filterHands)}
            />
            <Button
              icon="crosshairs"
              width="100%"
              height="100%"
              align="center"
              tooltip="Params"
              selected={filterUseParams}
              onClick={() => toggleUseParamsFilter(!filterUseParams)}
            />
          </Flex>
        }
      >
        <SearchBar
          query={searchText}
          onSearch={setSearchText}
          placeholder="Search all emotes..."
        />
      </Section>
      <Section
        title={
          searchText.length > 0
            ? `Search results of "${searchText}"`
            : `All Emotes`
        }
        buttons={
          <Flex justify="end" inline width="100%">
            <Button
              onClick={() => toggleShowNames(!showNames)}
              height="20px"
            >
              {showNames ? 'Show Names' : 'Show Keys'}
            </Button>
            <Button
              selected={showIcons}
              onClick={() => toggleShowIcons(!showIcons)}
              height="20px"
            >
              Show Icons
            </Button>
            <Button
              icon="crosshairs"
              selected={useParams}
              onClick={() => toggleUseParams(!useParams)}
              height="20px" // God knows why classic tg just breaks this button, this is a patchwork solution.
            >
              Use Params
            </Button>
          </Flex>
        }
      >
        <Flex>
          <Flex.Item>
            {emotes
              .filter(
                (emote) =>
                  emote.key &&
                  (searchText.length > 0
                    ? emote.key
                        .toLowerCase()
                        .includes(searchText.toLowerCase()) ||
                      emote.name
                        .toLowerCase()
                        .includes(searchText.toLowerCase())
                    : true) &&
                  (filterVisible ? emote.visible : true) &&
                  (filterAudible ? emote.audible : true) &&
                  (filterSound ? emote.sound : true) &&
                  (filterHands ? emote.hands : true) &&
                  (filterUseParams ? emote.use_params : true),
              )
              .sort((a, b) => (a.name > b.name ? 1 : -1))
              .map((emote) => (
                <Button
                  width={showIcons ? 16 : 12}
                  key={emote.name}
                  tooltip={
                    showIcons ? undefined : (
                      <EmoteIcons
                        visible={emote.visible}
                        audible={emote.audible}
                        sound={emote.sound}
                        hands={emote.hands}
                        use_params={emote.use_params}
                        margin={0.5}
                      />
                    )
                  }
                  onClick={() =>
                    act('play_emote', {
                      emote_key: emote.key,
                      use_params: useParams,
                    })
                  }
                >
                  <Box inline width="50%">
                    {showNames
                      ? capitalize(emote.name.toLowerCase())
                      : emote.key}
                  </Box>
                  {showIcons ? (
                    <EmoteIcons
                      visible={emote.visible}
                      audible={emote.audible}
                      sound={emote.sound}
                      hands={emote.hands}
                      use_params={emote.use_params}
                      margin={0}
                    />
                  ) : (
                    ''
                  )}
                </Button>
              ))}
          </Flex.Item>
        </Flex>
      </Section>
    </Section>
  );
};

const EmoteIcons = (props) => {
  const { visible, audible, sound, hands, use_params, margin } = props;

  return (
    <Box inline align="right">
      <Icon
        name="eye"
        m={margin}
        color={!visible ? 'red' : ''}
        opacity={!visible ? 0.5 : 1}
      />
      <Icon
        name="comment"
        m={margin}
        color={!audible ? 'red' : ''}
        opacity={!audible ? 0.5 : 1}
      />
      <Icon
        name="volume-up"
        m={margin}
        color={!sound ? 'red' : ''}
        opacity={!sound ? 0.5 : 1}
      />
      <Icon
        name="hand-paper"
        m={margin}
        color={!hands ? 'red' : ''}
        opacity={!hands ? 0.5 : 1}
      />
      <Icon
        name="crosshairs"
        m={margin}
        color={!use_params ? 'red' : ''}
        opacity={!use_params ? 0.5 : 1}
      />
    </Box>
  );
};

export const EmotePanel = (props) => {
  return (
    <Window width={630} height={500}>
      <Window.Content scrollable>
        <EmotePanelContent />
      </Window.Content>
    </Window>
  );
};
