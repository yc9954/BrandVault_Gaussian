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

export const getUserProducts = async(brandId: number) => {
     const product = await prisma.product.findMany({
        where: {
            brand_id: brandId,
        },
        include: {
            projects: true,
        },
    })
    return product;
}


