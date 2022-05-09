import { Window } from '../layouts';
import { Section } from '../components';

export const GenitalManager = (props, context) => {
  return (
    <Window
      title="PAIN AND SUFFERING"
      width={520}
      height={700}
    >
      <Window.Content scrollable>
        <Section />
      </Window.Content>
    </Window>
  );
};
