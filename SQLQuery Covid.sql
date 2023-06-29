


SELECT *
From Portfolio_Project..CovidDeaths
Order By 1,2


SELECT Location, date, total_cases, new_cases, total_deaths, population
From Portfolio_Project..CovidDeaths
Order By 1,2


Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Portfolio_Project..CovidDeaths
WHERE Location like 'Mozambique'
Order By 1,2


Select Location, date, total_cases, population, (total_cases/population)*100 as PercentagePopulation
From Portfolio_Project..CovidDeaths
Where location like 'Mozambique'
Order By 1,2

Select  Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentagePopulationInfected
From Portfolio_Project..CovidDeaths
Group By Location, population
Order By PercentagePopulationInfected desc


Select Location, MAX(CAST(Total_deaths as int)) as TotalDeathsCount
From Portfolio_Project..CovidDeaths
Where continent is not null
Group By Location
Order By TotalDeathsCount desc


Select continent, MAX(CAST(Total_deaths as int)) as TotalDeathsCount
From Portfolio_Project..CovidDeaths
Where continent is not null
Group By continent
Order By TotalDeathsCount desc


Select location, MAX(CAST(Total_deaths as int)) as TotalDeathsCount
From Portfolio_Project..CovidDeaths
Where continent is not null
Group By Location
Order By TotalDeathsCount desc



Select SUM(new_cases) as total_cases, SUM(Convert(int,new_deaths)) as total_deaths, SUM(Convert(int,new_deaths))/SUM(new_cases)*100 as DeathPercentage
From Portfolio_Project..CovidDeaths
Where continent is not null
--Group By date
Order By 1,2

Select  Location, Population, SUM(total_cases) as HighestInfectionCount, SUM((total_cases/population))*100 as PercentagePopulationInfected
From Portfolio_Project..CovidDeaths
Group By Location, population
Order By PercentagePopulationInfected desc


Select Location, SUM(CAST(Total_deaths as int)) as TotalDeathsCount
From Portfolio_Project..CovidDeaths
Where continent is not null
Group By Location
Order By TotalDeathsCount desc


Select continent, SUM(CAST(Total_deaths as int)) as TotalDeathsCount
From Portfolio_Project..CovidDeaths
Where continent is not null
Group By continent
Order By TotalDeathsCount desc


Select location, SUM(CAST(Total_deaths as int)) as TotalDeathsCount
From Portfolio_Project..CovidDeaths
Where continent is not null
Group By Location
Order By TotalDeathsCount desc



Select MAX(new_cases) as total_cases, MAX(Convert(int,new_deaths)) as total_deaths, MAX(Convert(int,new_deaths))/MAX(new_cases)*100 as DeathPercentage
From Portfolio_Project..CovidDeaths
Where continent is not null
--Group By date
Order By 1,2




Select  Location, Population, AVG(total_cases) as HighestInfectionCount, AVG((total_cases/population))*100 as PercentagePopulationInfected
From Portfolio_Project..CovidDeaths
Group By Location, population
Order By PercentagePopulationInfected desc


Select Location, AVG(CAST(Total_deaths as int)) as TotalDeathsCount
From Portfolio_Project..CovidDeaths
Where continent is not null
Group By Location
Order By TotalDeathsCount desc


Select continent, AVG(CAST(Total_deaths as int)) as TotalDeathsCount
From Portfolio_Project..CovidDeaths
Where continent is not null
Group By continent
Order By TotalDeathsCount desc


Select location, AVG(CAST(Total_deaths as int)) as TotalDeathsCount
From Portfolio_Project..CovidDeaths
Where continent is not null
Group By Location
Order By TotalDeathsCount desc



Select AVG(new_cases) as total_cases, AVG(Convert(int,new_deaths)) as total_deaths, AVG(Convert(int,new_deaths))/AVG(new_cases)*100 as DeathPercentage
From Portfolio_Project..CovidDeaths
Where continent is not null
--Group By date
Order By 1,2




Select *
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date


  Select dea.continent, dea.location, dea.date, dea.population, vac.people_fully_vaccinated
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
Order By 1,2



 Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
Order By 1,2


  Select dea.continent, dea.location, dea.date, dea.population, vac.positive_rate
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
Order By 1,2



  Select dea.continent, dea.location, dea.date, dea.population, vac.total_vaccinations
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
Order By 1,2



 Select dea.continent, dea.location, dea.date, dea.population, vac.tests_per_case
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
Order By 1,2



 Select dea.continent, dea.location, dea.date, dea.population, vac.female_smokers
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
Order By 1,2




 Select dea.continent, dea.location, dea.date, dea.population, vac.male_smokers
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
Order By 1,2





 Select dea.continent, dea.location, dea.date, dea.population, vac.extreme_poverty
 From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
Order By 1,2



With PopUvsPeo (continent, location, population, people_fully_vaccinated, fully_vaccinated) as
(
  Select dea.continent, dea.location, dea.population, vac.people_fully_vaccinated, SUM(CONVERT(int, vac.people_fully_vaccinated)) OVER (Partition By dea.location Order By dea.location) as fully_vaccinated
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
Where dea.continent is not null
--)Order By 1,2
)
Select*, (Population/fully_vaccinated)*100 
from PopuvsPeo




with PopUvsFS (continent, location, population, female_smokers, f_smokers) as
(
  Select dea.continent, dea.location, dea.population, vac.female_smokers, SUM(CONVERT(int, vac.female_smokers)) OVER (Partition By dea.location Order By dea.location) as f_smokers
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
Where dea.continent is not null
--)Order By 1,2
)
Select*, (Population/f_smokers)*100 
from PopuvsFS



With PopuvsVacc (continent, location, date, population, new_vaccinations, People_vaccinated)as
(
 Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(Convert(int,vac.new_vaccinations)) OVER (Partition By dea.location Order By dea.location, dea.date) as people_vaccinated
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
--Order By 2,3
)
Select *, (Population/People_vaccinated)*100
From PopuvsVacc



With PopuvsPos (continent, location, date, population, positive_rate, pro_positive_rate)as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.positive_rate, SUM(CAST(vac.positive_rate as int)) OVER (Partition By dea.location, dea.date) as pro_postive_rate
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
)
Select *, (Population/Pro_positive_rate)*100
From PopuvsPos




With PopuvsTot (continent, location, date, population, total_vaccinations, total_vacc)as
(
  Select dea.continent, dea.location, dea.date, dea.population, vac.total_vaccinations, SUM(CONVERT(int, vac.total_vaccinations)) OVER (Partition By dea.location, dea.date) as total_vacc
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
)
Select *, (Population/Total_vacc)*100
From PopuvsTot



With PopuvsPer (continent, location, date, population, tests_per_case, T_per_case)as
(
 Select dea.continent, dea.location, dea.date, dea.population, vac.tests_per_case,SUM(CONVERT(int, vac.tests_per_case)) OVER (Partition By dea.location, dea.date) as T_per_case
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null
)
Select *, (Population/T_per_case)*100
From PopuvsPer





With PopuvsMS (continent, location, population, male_smoker, m_smokers) as
(
 Select dea.continent, dea.location, dea.population, vac.male_smokers, SUM(Convert(int,vac.male_smokers)) OVER (Partition By dea.location Order By dea.location) as m_smokers
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
 -- and dea.date = vac.date
Where dea.continent is not null
--Order By 2,3
)
Select *, (Population/m_smokers)*100
From PopuvsMS




With PopuvsEX (continent, location, population, extreme_poverty, ex_poverty) as
(
 Select dea.continent, dea.location, dea.population, vac.extreme_poverty, SUM(Convert(int,vac.extreme_poverty)) OVER (Partition By dea.location Order By dea.location) as ex_poverty
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
 -- and dea.date = vac.date
Where dea.continent is not null
--Order By 2,3
)
Select *, (population/ex_poverty)*100
From PopuvsEX


--VIEWS FOR VISUALISATION

CREATE VIEW Extreme_Poverty as
 Select dea.continent, dea.location, dea.population, vac.extreme_poverty, SUM(Convert(int,vac.extreme_poverty)) OVER (Partition By dea.location Order By dea.location) as ex_poverty
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
 -- and dea.date = vac.date
Where dea.continent is not null
--Order By 2,3



Create View Male_Smokers as
Select dea.continent, dea.location, dea.population, vac.male_smokers, SUM(Convert(int,vac.male_smokers)) OVER (Partition By dea.location Order By dea.location) as m_smokers
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
 -- and dea.date = vac.date
Where dea.continent is not null


CREATE VIEW Female_Smokers as 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(Convert(int,vac.new_vaccinations)) OVER (Partition By dea.location Order By dea.location, dea.date) as people_vaccinated
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null



CREATE VIEW People_Vaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(Convert(int,vac.new_vaccinations)) OVER (Partition By dea.location Order By dea.location, dea.date) as people_vaccinated
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
  and dea.date = vac.date
Where dea.continent is not null



CREATE VIEW Fully_Vaccinated as
Select dea.continent, dea.location, dea.population, vac.people_fully_vaccinated, SUM(CONVERT(int, vac.people_fully_vaccinated)) OVER (Partition By dea.location Order By dea.location) as fully_vaccinated
From Portfolio_Project..CovidDeaths dea
join Portfolio_Project..CovidVaccinations vac
  on dea.location = vac.location
Where dea.continent is not null




