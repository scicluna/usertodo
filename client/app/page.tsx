import Link from "next/link";

export default function Home() {
  return (
    <main className="h-[100dvh] flex flex-col justify-center items-center gap-8 text-4xl font-extrabold">
      <Link className="hover:animate-pulse" href={'/roles'}>Roles</Link>
      <Link className="hover:animate-pulse" href={'/users'}>Users</Link>
    </main>
  )
}
