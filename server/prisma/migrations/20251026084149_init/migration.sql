-- CreateTable
CREATE TABLE "Admin" (
    "admin_id" SERIAL NOT NULL,
    "admin_name" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "department" TEXT NOT NULL,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("admin_id")
);

-- CreateTable
CREATE TABLE "Analytics_Report" (
    "report_id" SERIAL NOT NULL,
    "created_by" INTEGER NOT NULL,
    "report_name" TEXT NOT NULL,
    "summary" TEXT,
    "file_path" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Analytics_Report_pkey" PRIMARY KEY ("report_id")
);

-- CreateTable
CREATE TABLE "Report_purchase" (
    "purchase_id" SERIAL NOT NULL,
    "brand_id" INTEGER NOT NULL,
    "report_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "purchase_price" DOUBLE PRECISION NOT NULL,
    "purchase_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Report_purchase_pkey" PRIMARY KEY ("purchase_id")
);

-- CreateTable
CREATE TABLE "Brand" (
    "brand_id" SERIAL NOT NULL,
    "brand_name" TEXT NOT NULL,
    "contract_email" TEXT NOT NULL,
    "industry" TEXT,
    "status" TEXT NOT NULL,

    CONSTRAINT "Brand_pkey" PRIMARY KEY ("brand_id")
);

-- CreateTable
CREATE TABLE "Platform_User" (
    "user_id" SERIAL NOT NULL,
    "brand_id" INTEGER NOT NULL,
    "password" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "user_authority_level" TEXT NOT NULL,

    CONSTRAINT "Platform_User_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "Subscription_Plan" (
    "plan_id" SERIAL NOT NULL,
    "plan_name" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "billing_cyle" TEXT NOT NULL,
    "asset_Limit" INTEGER NOT NULL,

    CONSTRAINT "Subscription_Plan_pkey" PRIMARY KEY ("plan_id")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "subscription_id" SERIAL NOT NULL,
    "plan_id" INTEGER NOT NULL,
    "brand_id" INTEGER NOT NULL,
    "start_dare" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("subscription_id")
);

-- CreateTable
CREATE TABLE "BrandVault_Library" (
    "library_id" SERIAL NOT NULL,
    "library_name" TEXT NOT NULL,
    "library_type" TEXT NOT NULL,
    "total_assets" INTEGER NOT NULL,

    CONSTRAINT "BrandVault_Library_pkey" PRIMARY KEY ("library_id")
);

-- CreateTable
CREATE TABLE "Brand_Library_Access" (
    "access_id" SERIAL NOT NULL,
    "brand_id" INTEGER NOT NULL,
    "library_id" INTEGER NOT NULL,
    "access_level" TEXT NOT NULL,

    CONSTRAINT "Brand_Library_Access_pkey" PRIMARY KEY ("access_id")
);

-- CreateTable
CREATE TABLE "Master_Asset" (
    "master_asset_id" SERIAL NOT NULL,
    "library_id" INTEGER NOT NULL,
    "asset_name" TEXT NOT NULL,
    "asset_code" TEXT NOT NULL,
    "file_path" TEXT NOT NULL,
    "access_level" TEXT NOT NULL,

    CONSTRAINT "Master_Asset_pkey" PRIMARY KEY ("master_asset_id")
);

-- CreateTable
CREATE TABLE "Master_Asset_version" (
    "master_asset_version_id" SERIAL NOT NULL,
    "master_asset_id" INTEGER NOT NULL,
    "version_number" TEXT NOT NULL,
    "file_path" TEXT NOT NULL,
    "created_ar" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "asset_type" TEXT NOT NULL,

    CONSTRAINT "Master_Asset_version_pkey" PRIMARY KEY ("master_asset_version_id")
);

-- CreateTable
CREATE TABLE "Master_Asset_History" (
    "history_id" SERIAL NOT NULL,
    "master_asset_id" INTEGER NOT NULL,
    "version_major" TEXT NOT NULL,
    "version_minor" TEXT NOT NULL,
    "change_description" TEXT NOT NULL,
    "changed_by" TEXT NOT NULL,
    "changed_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Master_Asset_History_pkey" PRIMARY KEY ("history_id")
);

-- CreateTable
CREATE TABLE "Asset_Request" (
    "request_id" SERIAL NOT NULL,
    "brand_id" INTEGER NOT NULL,
    "master_asset_id" INTEGER NOT NULL,
    "admin_id" INTEGER NOT NULL,
    "request_type" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "request_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Asset_Request_pkey" PRIMARY KEY ("request_id")
);

-- CreateTable
CREATE TABLE "Product" (
    "product_id" SERIAL NOT NULL,
    "brand_id" INTEGER NOT NULL,
    "product_name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "calor" TEXT NOT NULL,
    "size" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "Product_Asset" (
    "product_id" INTEGER NOT NULL,
    "master_asset_version_id" INTEGER NOT NULL,

    CONSTRAINT "Product_Asset_pkey" PRIMARY KEY ("product_id","master_asset_version_id")
);

-- CreateTable
CREATE TABLE "Content_Partner" (
    "partner_id" SERIAL NOT NULL,
    "partner_bame" TEXT NOT NULL,
    "partner_type" TEXT NOT NULL,
    "is_authenticated" BOOLEAN NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Content_Partner_pkey" PRIMARY KEY ("partner_id")
);

-- CreateTable
CREATE TABLE "Message" (
    "message_id" SERIAL NOT NULL,
    "sender_id" INTEGER NOT NULL,
    "receiver_id" INTEGER NOT NULL,
    "sender_type" TEXT NOT NULL,
    "receiver_type" TEXT NOT NULL,
    "message_content" TEXT NOT NULL,
    "sent_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("message_id")
);

-- CreateTable
CREATE TABLE "Inquiry" (
    "inquiry_id" SERIAL NOT NULL,
    "partner_id" INTEGER NOT NULL,
    "brand_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "inquiry_type" TEXT NOT NULL,

    CONSTRAINT "Inquiry_pkey" PRIMARY KEY ("inquiry_id")
);

-- CreateTable
CREATE TABLE "AD_Contract" (
    "contract_id" SERIAL NOT NULL,
    "brand_id" INTEGER NOT NULL,
    "partner_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "contact_aroun" TEXT NOT NULL,
    "contract_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AD_Contract_pkey" PRIMARY KEY ("contract_id")
);

-- CreateTable
CREATE TABLE "Data_Usage_Log" (
    "log_id" SERIAL NOT NULL,
    "master_asset_id" INTEGER NOT NULL,
    "partner_id" INTEGER NOT NULL,
    "usage_purpose" TEXT NOT NULL,
    "usage_start_end" TEXT NOT NULL,

    CONSTRAINT "Data_Usage_Log_pkey" PRIMARY KEY ("log_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Brand_contract_email_key" ON "Brand"("contract_email");

-- AddForeignKey
ALTER TABLE "Analytics_Report" ADD CONSTRAINT "Analytics_Report_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "Admin"("admin_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report_purchase" ADD CONSTRAINT "Report_purchase_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "Brand"("brand_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report_purchase" ADD CONSTRAINT "Report_purchase_report_id_fkey" FOREIGN KEY ("report_id") REFERENCES "Analytics_Report"("report_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report_purchase" ADD CONSTRAINT "Report_purchase_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Platform_User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Platform_User" ADD CONSTRAINT "Platform_User_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "Brand"("brand_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_plan_id_fkey" FOREIGN KEY ("plan_id") REFERENCES "Subscription_Plan"("plan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "Brand"("brand_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Brand_Library_Access" ADD CONSTRAINT "Brand_Library_Access_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "Brand"("brand_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Brand_Library_Access" ADD CONSTRAINT "Brand_Library_Access_library_id_fkey" FOREIGN KEY ("library_id") REFERENCES "BrandVault_Library"("library_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Master_Asset" ADD CONSTRAINT "Master_Asset_library_id_fkey" FOREIGN KEY ("library_id") REFERENCES "BrandVault_Library"("library_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Master_Asset_version" ADD CONSTRAINT "Master_Asset_version_master_asset_id_fkey" FOREIGN KEY ("master_asset_id") REFERENCES "Master_Asset"("master_asset_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Master_Asset_History" ADD CONSTRAINT "Master_Asset_History_master_asset_id_fkey" FOREIGN KEY ("master_asset_id") REFERENCES "Master_Asset"("master_asset_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asset_Request" ADD CONSTRAINT "Asset_Request_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "Brand"("brand_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asset_Request" ADD CONSTRAINT "Asset_Request_master_asset_id_fkey" FOREIGN KEY ("master_asset_id") REFERENCES "Master_Asset"("master_asset_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asset_Request" ADD CONSTRAINT "Asset_Request_admin_id_fkey" FOREIGN KEY ("admin_id") REFERENCES "Admin"("admin_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "Brand"("brand_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product_Asset" ADD CONSTRAINT "Product_Asset_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product_Asset" ADD CONSTRAINT "Product_Asset_master_asset_version_id_fkey" FOREIGN KEY ("master_asset_version_id") REFERENCES "Master_Asset_version"("master_asset_version_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inquiry" ADD CONSTRAINT "Inquiry_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "Content_Partner"("partner_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inquiry" ADD CONSTRAINT "Inquiry_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "Brand"("brand_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inquiry" ADD CONSTRAINT "Inquiry_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AD_Contract" ADD CONSTRAINT "AD_Contract_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "Brand"("brand_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AD_Contract" ADD CONSTRAINT "AD_Contract_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "Content_Partner"("partner_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AD_Contract" ADD CONSTRAINT "AD_Contract_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Data_Usage_Log" ADD CONSTRAINT "Data_Usage_Log_master_asset_id_fkey" FOREIGN KEY ("master_asset_id") REFERENCES "Master_Asset"("master_asset_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Data_Usage_Log" ADD CONSTRAINT "Data_Usage_Log_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "Content_Partner"("partner_id") ON DELETE RESTRICT ON UPDATE CASCADE;
