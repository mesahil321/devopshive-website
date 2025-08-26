import "./globals.css";
import { ReactNode } from "react";

export const metadata = {
  title: "DevOpsHive",
  description: "Bees and DevOps together"
};

export default function RootLayout({
  children
}: {
  children: ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
