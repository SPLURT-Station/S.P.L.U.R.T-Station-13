import { NtosWindow } from '../layouts';
import { RequestKioskContent } from './RequestKiosk';

export const NtosRequestKiosk = (props, context) => {
  return (
    <NtosWindow
      width={550}
      height={600}>
      <NtosWindow.Content overflow="auto">
        <RequestKioskContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
