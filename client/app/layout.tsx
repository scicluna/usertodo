import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Todo List Manager',
  description: 'Generated by create next app',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={`${inter.className} bg-gradient-to-l from-purple-200 to-blue-200`}>
        <div>
          <a href='/' className='fixed top-2 left-2 text-purple-400 hover:text-purple-300 transition-all'>HOME</a>
        </div>
        {children}
      </body>
    </html>
  )
}