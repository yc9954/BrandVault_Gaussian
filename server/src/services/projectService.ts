import { prisma } from '../db.js'

export const getUserProjects = async (userId: number) => {
    const projects = await prisma.project.findMany({
        where: {
            creator_id: userId,
        },
        include: {
            creator: {
                select: {
                    user_name: true,
                }
            },
            products_used: true
        },
        orderBy: {
            created_at: 'desc'
        }
    })
    return projects;
}