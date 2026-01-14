// import GoogleOneTap from '@/Components/GoogleOneTap';
import { PropsWithChildren } from 'react';

export default function Guest({ children }: PropsWithChildren) {
    return (
        <div className="flex min-h-screen flex-col items-center justify-center bg-white">
            {/* <GoogleOneTap /> */}
            {children}
        </div>
    );
}
