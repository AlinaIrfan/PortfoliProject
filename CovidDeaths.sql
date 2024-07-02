SELECT 
    date,
    SUM(new_deaths) AS NewDeaths,
    SUM(new_cases) AS NewCases,
    CASE WHEN SUM(new_cases) = 0 THEN 0 ELSE (SUM(new_deaths) / SUM(new_cases)) * 100 END AS Deathrate
FROM 
    PortfolioProject.dbo.CovidDeaths
WHERE 
    continent IS NOT NULL 
GROUP BY 
    date
ORDER BY 1,2 
