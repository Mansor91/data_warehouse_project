/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse'
    after checking if it already exists. If the database
    exists, it is dropped and recreated. Additionally, the
    script sets up three schemas within the database:
    'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse'
    database if it exists. All data in the database will be
    permanently deleted. Proceed with caution and ensure you
    have proper backups before running this script.
=============================================================
*/

-- Step 1: Run this block connected to the 'postgres' database

-- Terminate all active connections to 'DataWarehouse'
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'DataWarehouse';

-- Drop the database if it exists
DROP DATABASE IF EXISTS "DataWarehouse";

-- Create the 'DataWarehouse' database
CREATE DATABASE "DataWarehouse"
    OWNER = dwh_user
    ENCODING = 'UTF8';

-- ============================================================
-- Step 2: Reconnect to 'DataWarehouse' then run the block below
-- ============================================================

-- Create Schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;