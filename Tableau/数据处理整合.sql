SELECT location, COALESCE(SUM(total_tests),0) AS TotalTests
FROM coviddata.covidvaccinations
GROUP BY location;

SELECT location, COALESCE(AVG(positive_rate) * 100,0) AS AveragePositiveRate
FROM coviddata.covidvaccinations
GROUP BY location;

SELECT location, COALESCE(SUM(total_vaccinations),0) AS TotalVaccinations
FROM coviddata.covidvaccinations
GROUP BY location;

SELECT location, COALESCE(SUM(total_vaccinations),0) AS TotalVaccinations, COALESCE(SUM(gdp_per_capita),0) AS GdpPerCapita
FROM coviddata.covidvaccinations
GROUP BY location
ORDER BY GdpPerCapita DESC;

SELECT location, (SUM(aged_70_older)/SUM(total_cases)) * 100 AS 70agedolderinfected
FROM coviddata.coviddeaths cd
GROUP BY location
ORDER BY 70agedolderinfected DESC;

SELECT 
    location,
    SUM(total_cases) AS TotalCases,
    SUM(hospital_beds_per_thousand) AS HospitalResources, 
    gdp_per_capita AS GDPPerCapita 
FROM coviddata.coviddeaths cv 
GROUP BY cv.location,cv.gdp_per_capita
ORDER BY cv.gdp_per_capita DESC;

Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From coviddata.coviddeaths
Group by Location, Population, date
order by PercentPopulationInfected desc;

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From coviddata.coviddeaths
Group by Location, Population
order by PercentPopulationInfected desc;

Select location, SUM(cast(new_deaths as signed)) as TotalDeathCount
From coviddata.coviddeaths
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc;

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as signed)) as total_deaths, SUM(cast(new_deaths as signed))/SUM(New_Cases)*100 as DeathPercentage
From coviddata.coviddeaths
where continent is not null 
order by 1,2




