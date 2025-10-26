import { prisma } from '../db.js'

export const getAllProducts = async() => {
    const products = await prisma.product.findMany({
        include: {
            brand: {
                select: {
                    brand_id: true,
                    brand_name: true,
                },
            },
        },
        orderBy: {
            product_id: 'desc',
        }
    });
    return products;
}

