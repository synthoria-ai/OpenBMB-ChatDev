import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'Dynamic Link-in-Bio',
  description: 'A dynamic link-in-bio application',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
