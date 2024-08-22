import { NtosWindow } from '../layouts';
import { StationAlertConsoleContent } from './StationAlertConsole';

export const NtosStationAlertConsole = () => {
  return (
    <NtosWindow
      width={335}
      height={587}>
      <NtosWindow.Content overflow="auto">
        <StationAlertConsoleContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
