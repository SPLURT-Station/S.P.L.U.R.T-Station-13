import { Fragment } from "inferno";

import { useBackend, useLocalState } from '../backend';
import { Box, Button, Collapsible, Dropdown, Flex, Input, LabeledList, NoticeBox, NumberInput, Section, Slider, Tabs } from '../components';
import { Window } from '../layouts';

const PAGES = [
  {
    title: 'General',
    component: () => GeneralActions,
    color: "green",
    icon: "tools",
  },
  {
    title: 'Mob',
    component: () => PhysicalActions,
    color: "yellow",
    icon: "bolt",
    canAccess: data => {
      return !!data.mob_type.includes("/mob/living");
    },
  },
  {
    title: 'Transform',
    component: () => TransformActions,
    color: "orange",
    icon: "exchange-alt",
  },
  {
    title: 'Punish',
    component: () => PunishmentActions,
    color: "red",
    icon: "gavel",
  },
  {
    title: 'Feature Bans',
    component: () => FeatureBanTabs,
    color: "red",
    icon: "gavel",
    canAccess: data => {
      return data.client_ckey;
    },
  },
  {
    title: 'Fun',
    component: () => FunActions,
    color: "blue",
    icon: "laugh",
  },
  {
    title: 'Other',
    component: () => OtherActions,
    color: "blue",
    icon: "crosshairs",
  },
];

export const PlayerPanel2 = (props, context) => {
  const { act, data } = useBackend(context);
  const [pageIndex, setPageIndex] = useLocalState(context, 'pageIndex', 0);
  const PageComponent = PAGES[pageIndex].component();

  const { mob_name, mob_type, client_ckey, client_rank, playtimes_enabled,
    playtime } = data;

  return (
    <Window
      title={`${mob_name} Player Panel`}
      width={600}
      height={500}
    >
      <Window.Content scrollable>
        <Section md={1}>
          <Flex>
            <Flex.Item width="80px" color="label" align="center">Name:</Flex.Item>
            <Flex.Item grow={1}>
              <Input width="100%" value={mob_name} onChange={(e, value) => act("set_name", { name: value })} />
            </Flex.Item>
            {!!client_ckey && (
              <Flex.Item>
                <Box inline ml=".75rem" mr=".5rem" color="label">Rank:</Box>
                <Flex.Item inline>
                  <Button
                    minWidth="11rem" textAlign="center"
                    content={client_rank}
                    onClick={() => act("edit_rank")}
                  />
                </Flex.Item>
              </Flex.Item>
            )}
          </Flex>
          <Flex mt={1} align="center" wrap="wrap" justify="flex-end">
            <Flex.Item width="80px" color="label">Mob Type:</Flex.Item>
            <Flex.Item grow={1} align="right">{mob_type}</Flex.Item>
            <Flex.Item align="right">
              <Button
                minWidth="11rem" textAlign="center"
                ml=".5rem"
                icon="window-restore"
                content="Access Variables"
                onClick={() => act("access_variables")}
              />
            </Flex.Item>
            {!!client_ckey && (
              <Flex.Item>
                <Button
                  minWidth="11rem" textAlign="center"
                  ml=".5rem"
                  icon="window-restore"
                  content={playtimes_enabled ? playtime : "Playtimes"}
                  disabled={!playtimes_enabled}
                  onClick={() => act("access_playtimes")}
                />
              </Flex.Item>
            )}
          </Flex>
          {!!client_ckey && (
            <Flex mt={1} align="center">
              <Flex.Item width="80px" color="label">Client:</Flex.Item>
              <Flex.Item grow={1}>{client_ckey}</Flex.Item>

              <Flex.Item align="right">
                <Button
                  minWidth="11rem" textAlign="center"
                  mx=".5rem"
                  icon="comment-dots"
                  onClick={() => act("private_message")}
                  content="Private Message"
                />
                <Button
                  minWidth="11rem" textAlign="center"
                  icon="phone-alt"
                  onClick={() => act("subtle_message")}
                  content="Subtle Message"
                />
              </Flex.Item>
            </Flex>
          )}
        </Section>
        <Flex grow>
          <Flex.Item>
            <Section fitted>
              <Tabs vertical>
                {PAGES.map((page, i) => {
                  if (page.canAccess && !page.canAccess(data)) {
                    return;
                  }

                  return (
                    <Tabs.Tab
                      key={i}
                      color={page.color}
                      selected={i === pageIndex}
                      icon={page.icon}
                      onClick={() => setPageIndex(i)}>
                      {page.title}
                    </Tabs.Tab>
                  );
                })}
              </Tabs>

            </Section>
          </Flex.Item>
          <Flex.Item grow>
            <PageComponent />
          </Flex.Item>
        </Flex>
      </Window.Content>
    </Window>
  );
};

const PhysicalActions = (props, context) => {
  const { act, data } = useBackend(context);
  const { glob_limbs, godmode, mob_type, initial_scale } = data;
  const [mobScale, setMobScale] = useLocalState(context, 'mobScale', initial_scale);
  const limbs = Object.keys(glob_limbs);
  const limb_flags = limbs.map((_, i) => (1<<i));
  const [delimbOption, setDelimbOption] = useLocalState(context, "delimb_flags", 0);

  return (
    <Section fill>
      <Section title="Traits" buttons={
        <Button
          icon={godmode ? 'check-square-o' : 'square-o'}
          color={godmode ? 'green' : 'transparent'}
          content="God Mode"
          onClick={() => act("toggle_godmode")}
        />
      }>
        <Flex>
          <Button
            width="100%"
            icon="paw"
            content="Species"
            disabled={!mob_type.includes("/mob/living/carbon/human")}
            onClick={() => act("species")}
          />
          <Button
            width="100%"
            icon="bolt"
            content="Quirks"
            disabled={!mob_type.includes("/mob/living/carbon/human")}
            onClick={() => act("quirk")}
          />
          <Button
            width="100%"
            icon="magic"
            content="Spells"
            onClick={() => act("spell")}
          />
          <Button
            width="100%"
            height="100%"
            icon="fist-raised"
            content="Martial Arts"
            disabled={!mob_type.includes("/mob/living/carbon/human")}
            onClick={() => act("martial_art")}
          />
        </Flex>
      </Section>
      <Section title="Limbs" buttons={(
        <Flex>
          {limbs.map((val, index) => (
            <Button.Checkbox
              key={index}
              content={val}
              height="100%"
              checked={delimbOption & limb_flags[index]}
              disabled={!mob_type.includes("/mob/living/carbon/human")}
              onClick={() => setDelimbOption(
                (delimbOption & limb_flags[index])
                  ? delimbOption & ~limb_flags[index]
                  : delimbOption|limb_flags[index]
              )}
            />
          ))}
        </Flex>
      )}>
        <Flex>
          <Button.Confirm
            width="100%"
            icon="unlink"
            content="Delimb"
            color="red"
            disabled={!mob_type.includes("/mob/living/carbon/human")}
            onClick={() => act("limb", {
              limbs: limb_flags.map((val, index) =>
                !!(delimbOption & val) && glob_limbs[limbs[index]]
              ),
              delimb_mode: true,
            })}
          />
          <Button.Confirm
            width="100%"
            height="100%"
            icon="link"
            content="Relimb"
            color="green"
            disabled={!mob_type.includes("/mob/living/carbon/human")}
            onClick={() => act("limb", {
              limbs: limb_flags.map((val, index) =>
                !!(delimbOption & val) && glob_limbs[limbs[index]]
              ),
            })}
          />
        </Flex>
      </Section>
      <Section title="Scale" buttons={
        <Button
          icon="sync"
          content="Reset"
          onClick={() => {
            setMobScale(initial_scale);
            act("scale", { new_scale: initial_scale });
          }}
        />
      }>
        <Flex
          mt={1}
        >
          <Slider
            minValue={.25}
            maxValue={8}
            value={mobScale}
            stepPixelSize={12}
            step={.25}
            onChange={(e, value) => {
              setMobScale(value); // Update slider value
              act("scale", { new_scale: value }); // Update mob's value
            }}
            unit="x"
          />
        </Flex>
      </Section>
      <Section title="Speak">
        <Flex mt={1}>
          <Flex.Item width="100px" color="label">Force Say:</Flex.Item>
          <Flex.Item grow={1}>
            <Input
              width="100%"
              onEnter={(e, value) => act("force_say", { to_say: value })}
            />
          </Flex.Item>
        </Flex>
        <Flex mt={2}>
          <Flex.Item width="100px" color="label">Force Emote:</Flex.Item>
          <Flex.Item grow={1}>
            <Input
              width="100%"
              onEnter={(e, value) => act("force_emote", { to_emote: value })}
            />
          </Flex.Item>
        </Flex>
      </Section>
    </Section>
  );
};


const FeatureBanTabs = (props, context) => {
  const { data } = useBackend(context);
  const [jobbanTab, setJobbanTab] = useLocalState(context, 'jobbanTab', 0);
  const { roles } = data;
  return (
    <Flex>
      <Flex.Item>
        <Section fitted>
          <Tabs vertical>
            {roles.map((role_category, i) => { return (
              <Tabs.Tab
                key={role_category.category_name}
                color={role_category.category_color}
                py=".5rem"
                selected={jobbanTab === i}
                onClick={() => setJobbanTab(i)}>
                {role_category.category_name}
              </Tabs.Tab>
            ); })}
          </Tabs>
        </Section>
      </Flex.Item>

      <Flex.Item grow>
        <FeatureBans />
      </Flex.Item>
    </Flex>
  );
};

const FeatureBans = (props, context) => {
  const { act, data } = useBackend(context);
  const [jobbanTab] = useLocalState(context, 'jobbanTab', 0);
  const { roles, antag_ban_reason } = data;
  return (
    <Section fill>
      <Section
        title={roles[jobbanTab].category_name}
        buttons={(
          <Fragment>
            <Button
              content="Unban All"
              color="good"
              icon="lock-open"
              minWidth="8rem"
              textAlign="center"
              onClick={() => act("job_ban", {
                selected_role: roles[jobbanTab].category_name,
                is_category: true,
              })} />
            <Button
              content="Ban All"
              color="bad"
              icon="lock"
              minWidth="8rem"
              textAlign="center"
              onClick={() => act("job_ban", {
                selected_role: roles[jobbanTab].category_name,
                is_category: true,
                want_to_ban: true,
              })} />
          </Fragment>
        )}
      >
        <Flex wrap="wrap" justify="space-between">
          {roles[jobbanTab].category_name === "Antagonists" && (
            <NoticeBox
              width="100%"
              danger={antag_ban_reason ? true : false}
            >
              <Flex justify="space-between" align="center">
                <Flex.Item width="100%">
                  This player is {antag_ban_reason ? "" : "not"} antagonist banned
                </Flex.Item>
                <Flex.Item>
                  <Button
                    align="right"
                    ml=".5rem"
                    px="2rem"
                    py=".5rem"
                    color={antag_ban_reason ? "orange" : ""}
                    tooltip={antag_ban_reason ? "Reason: " + antag_ban_reason : ""}
                    content={antag_ban_reason ? "Unban" : "Ban"}
                    onClick={() => act("job_ban", {
                      selected_role: "Syndicate",
                      want_to_ban: (antag_ban_reason ? false : true),
                    })}
                  />
                </Flex.Item>
              </Flex>
            </NoticeBox>
          )}

          {roles[jobbanTab].category_roles.map((role) => { return (
            <Flex.Item
              key={0}
              width="49%"
            >

              <Button
                width="100%"
                py=".5rem"
                mb=".5rem"
                icon={role.ban_reason ? "lock" : "lock-open"}
                color={role.ban_reason ? "bad" : "transparent"}
                tooltip={role.ban_reason ? "Reason: " + role.ban_reason : ""}
                content={role.name}
                onClick={() => act("job_ban", {
                  selected_role: role.name,
                  want_to_ban: (role.ban_reason ? false : true),
                })} />
            </Flex.Item>
          ); })}

        </Flex>
      </Section>
    </Section>
  );
};

const GeneralActions = (props, context) => {
  const { act, data } = useBackend(context);
  const { client_ckey, mob_type, admin_mob_type } = data;
  return (
    <Section>
      <Section title="Damage">
        <Flex>
          <Button
            width="100%"
            icon="heart"
            color="green"
            content="Rejuvenate"
            disabled={!mob_type.includes("/mob/living")}
            onClick={() => act("heal")}
          />
          <Button
            width="100%"
            height="100%"
            icon="bolt"
            color="orange"
            content="Smite"
            confirmColor="average"
            disabled={!mob_type.includes("/mob/living/carbon/human")}
            onClick={() => act("smite")}
          />
        </Flex>
      </Section>

      <Section title="Teleportation">
        <Flex>
          <Button.Confirm
            width="100%"
            icon="reply"
            content="Bring"
            onClick={() => act("bring")}
          />
          <Button
            width="100%"
            content="Orbit"
            onClick={() => act("orbit")}
          />
          <Button.Confirm
            width="100%"
            height="100%"
            icon="share"
            content="Jump To"
            onClick={() => act("jump_to")}
          />
        </Flex>
      </Section>

      <Section title="Miscellaneous">
        <Flex>
          <Button
            width="100%"
            content="Select Equipment"
            icon="user-tie"
            disabled={!mob_type.includes("/mob/living/carbon/human")}
            onClick={() => act("select_equipment")}
          />
          <Button.Confirm
            content="Drop All Items"
            icon="trash-alt"
            width="100%"
            height="100%"
            disabled={!mob_type.includes("/mob/living/carbon/human")}
            onClick={() => act("strip")}
          />
        </Flex>
        <Flex>
          <Button.Confirm
            content="Send To Cryo"
            icon="snowflake"
            width="100%"
            color="orange"
            disabled={!mob_type.includes("/mob/living/carbon/human")}
            onClick={() => act("cryo")}
          />
          <Button.Confirm
            width="100%"
            height="100%"
            content="Send To Lobby"
            color="orange"
            icon="undo"
            disabled={!mob_type.includes("/mob/dead/observer")}
            tooltip={mob_type !== "/mob/dead/observer" ? "Can only be used on ghosts" : ""}
            onClick={() => act("lobby")}
          />
        </Flex>
      </Section>
      <Section title="Control">
        <Flex>
          <Button.Confirm
            width="100%"
            icon="ghost"
            content="Eject Ghost"
            confirmColor="bad"
            disabled={!client_ckey || !mob_type.includes("/mob/living")}
            onClick={() => act("ghost")}
          />
          <Button.Confirm
            width="100%"
            content="Take Control"
            confirmColor="bad"
            disabled={mob_type.includes("/mob/dead/observer") || !admin_mob_type.includes("/mob/dead/observer")}
            onClick={() => act("take_control")}
          />
          <Button.Confirm
            width="100%"
            height="100%" // weird ass bug here, so height set to 100%
            icon="ghost"
            content="Offer Control"
            tooltip="Offers control to ghosts"
            disabled={!mob_type.includes("/mob/living")}
            onClick={() => act("offer_control")}
          />
        </Flex>
      </Section>
    </Section>
  );
};

const PunishmentActions = (props, context) => {
  const { act, data } = useBackend(context);
  const { client_ckey, mob_type, is_frozen, is_slept, glob_mute_bits,
    client_muted, data_related_cid, data_related_ip, data_byond_version,
    data_player_join_date, data_account_join_date, active_role_ban_count,
    current_time } = data;
  return (
    <Section>
      <Flex>
        <Button
          width="50%"
          py=".5rem"
          icon="clipboard-list"
          color="orange"
          content="Notes"
          textAlign="center"
          disabled={!client_ckey}
          onClick={() => act("notes")}
        />
        <Button
          width="50%"
          height="100%"
          py=".5rem"
          icon="clipboard-list"
          color="orange"
          content="Logs"
          textAlign="center"
          onClick={() => act("logs")}
        />
      </Flex>
      <Section title="Contain">
        <Flex>
          <Button
            width="100%"
            content="Freeze"
            color={is_frozen ? "orange" : ""}
            icon={is_frozen ? 'check-square-o' : 'square-o'}
            disabled={!mob_type.includes("/mob/living")}
            onClick={() => act("freeze")}
          />
          <Button
            width="100%"
            content="Sleep"
            color={is_slept ? "orange" : ""}
            icon={is_slept ? 'check-square-o' : 'square-o'}
            disabled={!mob_type.includes("/mob/living")}
            onClick={() => act("sleep")}
          />
          <Button.Confirm
            width="100%"
            height="100%"
            content="Admin Prison"
            icon="share"
            color="bad"
            disabled={!mob_type.includes("/mob/living")}
            onClick={() => act("prison")}
          />
        </Flex>
      </Section>

      <Section title="Banishment">
        <Flex>
          <Button.Confirm
            width="100%"
            icon="ban"
            color="red"
            content="Kick"
            disabled={!client_ckey}
            onClick={() => act("kick")}
          />
          <Button
            width="100%"
            icon="gavel"
            color="red"
            content="Ban"
            disabled={!client_ckey}
            onClick={() => act("ban")}
          />
          <Button
            width="100%"
            height="100%"
            icon="gavel"
            color="red"
            content="Sticky Ban"
            disabled={!client_ckey}
            onClick={() => act("sticky_ban")}
          />
        </Flex>
      </Section>

      <Section title="Mute" buttons={
        <Fragment>
          <Button
            icon="lock-open"
            color="green"
            content="Unmute All"
            disabled={!client_ckey}
            onClick={() => act("unmute_all")}
          />
          <Button
            icon="lock"
            color="red"
            content="Mute All"
            disabled={!client_ckey}
            onClick={() => act("mute_all")}
          />
        </Fragment>
      }>
        <Flex>
          {glob_mute_bits.map((bit, i) => {
            const isMuted = (client_muted && (client_muted & bit.bitflag));
            return (
              <Button
                key={i}
                width="100%"
                height="100%"
                icon={isMuted ? 'check-square-o' : 'square-o'}
                color={isMuted? "bad" : ""}
                content={bit.name}
                disabled={!client_ckey}
                onClick={() => act("mute", { "mute_flag": !isMuted? client_muted | bit.bitflag : client_muted & ~bit.bitflag })}
              />
            );
          }) }
        </Flex>
      </Section>
      <Section title="Investigate"
        buttons={(
          <Flex>
            <Flex.Item align="center" mr=".5rem" color="label">
              Related accounts by:
            </Flex.Item>
            <Button
              minWidth="5rem"
              color="orange"
              content="CID"
              textAlign="center"
              mr=".5rem"
              disabled={!data_related_cid}
              onClick={() => act("related_accounts", { related_thing: "CID" })}
            />
            <Button
              minWidth="5rem"
              height="100%"
              color="orange"
              textAlign="center"
              content="IP"
              disabled={!data_related_ip}
              onClick={() => act("related_accounts", { related_thing: "IP" })}
            />
          </Flex>
        )}>
        <Collapsible
          width="100%"
          color="orange"
          content="Details"
          disabled={!client_ckey}
        >
          <LabeledList >
            <LabeledList.Item label="NOW" color="label">{current_time}</LabeledList.Item>
            <LabeledList.Item label="Account made">{data_account_join_date}</LabeledList.Item>
            <LabeledList.Item label="First joined server">{data_player_join_date}</LabeledList.Item>
            <LabeledList.Item label="Byond version">{data_byond_version}</LabeledList.Item>
            <LabeledList.Item label="Active bans">{active_role_ban_count}</LabeledList.Item>
          </LabeledList>
        </Collapsible>
      </Section>
    </Section>
  );
};

const TransformActions = (props, context) => {
  const { act, data } = useBackend(context);
  const { transformables, mob_type } = data;
  return (
    <Section>

      <Button
        width="100%"
        content="Custom"
        py=".5rem"
        textAlign="center"
        onClick={() => act("transform", { newType: "/mob/living" })}
      />

      {transformables.map((transformables_category) => { return (
        <Section
          title={transformables_category.name}
          key={0}>
          <Flex wrap="wrap" justify="space-between">
            {transformables_category.types.map((transformables_type) => {
              return (
                <Flex.Item key={0} width="calc(33.3% - .125rem)" mb=".25rem">
                  <Button.Confirm
                    width="100%"
                    height="100%"
                    color={transformables_category.color}
                    content={transformables_type.name}
                    disabled={mob_type === transformables_type.key}
                    onClick={() => act("transform", { newType: transformables_type.key, newTypeName: transformables_type.name })}
                  />
                </Flex.Item>
              ); })}
          </Flex>
        </Section>
      ); })}
    </Section>
  );
};

const FunActions = (props, context) => {
  const { act } = useBackend(context);

  const colours = {
    'White': '#a4bad6',
    'Dark': '#42474D',
    'Red': '#c51e1e',
    'Red Bright': '#FF0000',
    'Velvet': '#660015',
    'Green': '#059223',
    'Blue': '#6685f5',
    'Purple': '#800080',
    'Purple Dark': '#5000A0',
    'Narsie': '#973e3b',
    'Ratvar': '#BE8700',
  };

  const [lockExplode, setLockExplode] = useLocalState(context, "explode_lock_toggle", true);
  const [empMode, setEmpMode] = useLocalState(context, "empMode", false);
  const [expPower, setExpPower] = useLocalState(context, "exp_power", 8);
  const [narrateSize, setNarrateSize] = useLocalState(context, "narrateSize", 1);
  const [narrateMessage, setNarrateMessage] = useLocalState(context, "narrateMessage", "");
  const [narrateColour, setNarrateColour] = useLocalState(context, "narrateColour", Object.keys(colours)[0]);
  const [narrateFont, setNarrateFont] = useLocalState(context, "narrateFont", "Verdana");
  const [narrateBold, setNarrateBold] = useLocalState(context, "narrateBold", false);
  const [narrateItalic, setNarrateItalic] = useLocalState(context, "narrateItalic", false);
  const [narrateGlobal, setNarrateGlobal] = useLocalState(context, "narrateGlobal", false);
  const [narrateRange, setNarrateRange] = useLocalState(context, "narrateRange", 7);



  const narrateStyles = {
    'color': colours[narrateColour],
    'font-size': narrateSize + 'rem',
    'font-weight': (narrateBold ? 'bold' : ''),
    'font-family': narrateFont,
    'font-style': (narrateItalic ? 'italic' : ''),
  };

  return (
    <Section fill>
      <NoticeBox info textAlign="center">
        These features are centred on YOUR viewport
      </NoticeBox>

      <Section title="Explosion" buttons={(
        <Fragment>
          <Button.Checkbox
            checked={empMode}
            color="transparent"
            content="EMP Mode"
            onClick={() => setEmpMode(!empMode)}
          />
          <Button
            icon={lockExplode? "lock" : "lock-open"}
            content={lockExplode? "Locked" : "Unlocked"}
            onClick={() => setLockExplode(!lockExplode)}
            color={lockExplode? "green" : "bad"}
          />
        </Fragment>
      )}>
        <Flex
          align="right"
          grow={1}
          mt={1}
        >
          <Flex.Item>
            <Button
              width="100%"
              height="100%"
              color="red"
              disabled={lockExplode}
              onClick={() => act("explode", { power: expPower, emp_mode: empMode })}
            >
              <Box height="100%" pt={2} pb={2} textAlign="center">Detonate</Box>
            </Button>
          </Flex.Item>
          <Flex.Item
            ml={1}
            grow={1}
          >
            <Slider
              unit="Range"
              value={expPower}
              stepPixelSize={15}
              onDrag={(e, value) => setExpPower(value)}
              ranges={{
                green: [0, 8],
                orange: [8, 15],
                red: [15, 30],
              }}
              minValue={1}
              maxValue={30}
              height="100%"
            />
          </Flex.Item>
        </Flex>
      </Section>
      <Section title="Narrate"
        buttons={
          <Button
            content="Global Narrate"
            value={narrateGlobal}
            icon={narrateGlobal? 'check-square-o' : 'square-o'}
            color={narrateGlobal? 'red' : 'transparent'}
            onClick={() => setNarrateGlobal(!narrateGlobal)}
          />
        }>
        <Flex width="100%">
          <Flex width="100%" wrap>
            <Flex.Item width="52%">
              <LabeledList>
                <LabeledList.Item label="Colour">
                  <Dropdown
                    width="calc(100% - 1rem)"
                    displayText={narrateColour}
                    options={Object.keys(colours)}
                    onSelected={(value) => setNarrateColour(value)}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Font">
                  <Dropdown
                    width="calc(100% - 1rem)"
                    displayText={narrateFont}
                    options={["Verdana", "Consolas", "Trebuchet MS", "Comic Sans MS", "Times New Roman"]}
                    onSelected={(value) => setNarrateFont(value)} />
                </LabeledList.Item>
              </LabeledList>
            </Flex.Item>
            <Flex.Item width="20%">
              <LabeledList>
                <LabeledList.Item label="Bold">
                  <Button.Checkbox
                    checked={narrateBold}
                    height="100%"
                    color="transparent"
                    onClick={() => setNarrateBold(!narrateBold)}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Italic">
                  <Button.Checkbox
                    checked={narrateItalic}
                    height="100%"
                    color="transparent"
                    onClick={() => setNarrateItalic(!narrateItalic)}
                  />
                </LabeledList.Item>
              </LabeledList>
            </Flex.Item>
            <Flex.Item width="28%">
              <LabeledList>
                <LabeledList.Item label="Size">
                  <NumberInput
                    width="100%"
                    value={narrateSize}
                    minValue={1}
                    maxValue={6}
                    unit="rem"
                    align="center"
                    stepPixelSize="25"
                    onDrag={(e, value) => setNarrateSize(value)} />
                </LabeledList.Item>
                {!narrateGlobal && (
                  <LabeledList.Item label="Range">
                    <NumberInput
                      width="100%"
                      value={narrateRange}
                      minValue={1}
                      maxValue={14}
                      unit="Tiles"
                      align="center"
                      stepPixelSize="25"
                      onDrag={(e, value) => setNarrateRange(value)} />
                  </LabeledList.Item>
                )}
              </LabeledList>
            </Flex.Item>
          </Flex>
        </Flex>

        <Flex mt="1rem">
          <Flex.Item width="100%" mr="1rem">
            <Input
              width="100%"
              my=".5rem"
              onInput={(e, value) => setNarrateMessage(value)}
            />
          </Flex.Item>

          <Button
            content="Broadcast"
            color="green"
            p=".5rem"
            textAlign="center"
            disabled={!narrateMessage}
            onClick={(e) => act("narrate", { message: narrateMessage, classes: narrateStyles, range: narrateRange, mode_global: narrateGlobal })}
          />
        </Flex>

        <Box
          style={narrateStyles}
          mt="1rem"
          pl=".5rem"
          width="37rem"
          maxWidth="37rem"
        >{narrateMessage}
        </Box>
      </Section>
    </Section>
  );
};

const OtherActions = (props, context) => {
  const { act, data } = useBackend(context);
  const { mob_type, client_ckey } = data;

  return (
    <Section fill>
      <Section title="Miscellaneous Features">
        <Button
          width="100%"
          content="Traitor Panel"
          p=".5rem"
          mb=".5rem"
          textAlign="center"
          disabled={!client_ckey}
          onClick={(e) => act("traitor_panel")}
        />
        <Button
          width="100%"
          content="Languages"
          p=".5rem"
          mb=".5rem"
          textAlign="center"
          disabled={!mob_type.includes("/mob/living")}
          onClick={(e) => act("languages")}
        />
        <Button
          width="100%"
          content="Objectives / Ambitions"
          p=".5rem"
          textAlign="center"
          disabled={!client_ckey}
          onClick={(e) => act("ambitions")}
        />
      </Section>
    </Section>
  );
};
