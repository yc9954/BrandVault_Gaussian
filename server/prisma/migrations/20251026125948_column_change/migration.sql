/*
  Warnings:

  - You are about to drop the column `contact_aroun` on the `AD_Contract` table. All the data in the column will be lost.
  - You are about to drop the column `partner_bame` on the `Content_Partner` table. All the data in the column will be lost.
  - You are about to drop the column `created_ar` on the `Master_Asset_version` table. All the data in the column will be lost.
  - You are about to drop the column `calor` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `start_dare` on the `Subscription` table. All the data in the column will be lost.
  - You are about to drop the column `billing_cyle` on the `Subscription_Plan` table. All the data in the column will be lost.
  - Added the required column `contact_amount` to the `AD_Contract` table without a default value. This is not possible if the table is not empty.
  - Added the required column `partner_name` to the `Content_Partner` table without a default value. This is not possible if the table is not empty.
  - Added the required column `color` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start_date` to the `Subscription` table without a default value. This is not possible if the table is not empty.
  - Added the required column `billing_cycle` to the `Subscription_Plan` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "AD_Contract" DROP COLUMN "contact_aroun",
ADD COLUMN     "contact_amount" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Content_Partner" DROP COLUMN "partner_bame",
ADD COLUMN     "partner_name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Master_Asset_version" DROP COLUMN "created_ar",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "calor",
ADD COLUMN     "color" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Subscription" DROP COLUMN "start_dare",
ADD COLUMN     "start_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Subscription_Plan" DROP COLUMN "billing_cyle",
ADD COLUMN     "billing_cycle" TEXT NOT NULL;
