import {
    HoverCard,
    HoverCardContent,
    HoverCardTrigger,
} from "@/components/ui/hover-card"

type TodoHoverProps = {
    title: string
    description: string
}

export default function TodoHover({ title, description }: TodoHoverProps) {
    return (
        <HoverCard>
            <HoverCardTrigger>{title}</HoverCardTrigger>
            <HoverCardContent>
                {description}
            </HoverCardContent>
        </HoverCard>
    )
}