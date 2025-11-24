-----1. View the first 100 rows of the dataset to understand its structure.--------

SELECT TOP (100) [player_name]
      ,[team]
      ,[date_of_birth]
      ,[age]
      ,[marital_status]
      ,[number_of_kids]
      ,[nationality]
      ,[country_of_birth]
      ,[position]
      ,[preferred_foot]
      ,[height_cm]
      ,[weight_kg]
      ,[jersey_number]
      ,[injury_status]
      ,[agent]
      ,[matches_played]
      ,[minutes_played]
      ,[goals]
      ,[assists]
      ,[tackles]
      ,[interceptions]
      ,[saves]
      ,[clean_sheets]
      ,[yellow_cards]
      ,[red_cards]
      ,[passing_accuracy]
      ,[shot_accuracy]
      ,[previous_club]
      ,[years_at_club]
      ,[contract_end_year]
      ,[average_salary_zar]
      ,[market_value_zar]
      ,[signing_bonus_zar]
      ,[release_clause_zar]
  FROM [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
-------------------------------------------------------------------------------------------

-----2. Count the total number of players in the dataset.
SELECT COUNT(*) AS TotalPlayers
FROM ketro_sa_soccer_dataset_advanced;

--------------------------------------------------------------------------------------------
-------- 3. List all unique teams in the league.

SELECT DISTINCT team
FROM ketro_sa_soccer_dataset_advanced;

---------------------------------------------------------------------------------------------
--------4. Count how many players are in each team.

SELECT 
   team,
   COUNT(*) AS players
FROM ketro_sa_soccer_dataset_advanced
Group By team
-----------------------------------------------------------------------------------------------
-------5. Identify the top 10 players with the most goals.

SELECT TOP 10
    player_name,
    goals
FROM ketro_sa_soccer_dataset_advanced
ORDER BY goals DESC;

----------------------------------------------------------------------------------------
--------6. Find the average salary for players in each team.


SELECT team,
       AVG(TRY_CAST(average_salary_zar AS FLOAT)) AS average_salary
FROM ketro_sa_soccer_dataset_advanced
GROUP BY team;

SELECT 
    team,
    AVG(CAST(average_salary_zar AS DECIMAL(18,2))) AS avg_team_salary
FROM ketro_sa_soccer_dataset_advanced
GROUP BY team;

----------------------------------------------------------------------------------------

--------7. Retrieve the top 10 players with the highest market value.

Select Top 10 
    player_name,
    market_value_zar
From ketro_sa_soccer_dataset_advanced
Order By market_value_zar ASC

------------------------------------------------------------------------------------------

-----------------8. Calculate the average passing accuracy for each position.

SELECT 
    position,
    AVG(CAST(passing_accuracy AS FLOAT)) AS avg_passing_accuracy
FROM ketro_sa_soccer_dataset_advanced
GROUP BY position;

-----------------------------------------------------------------------------------------------

------9. Compare shot accuracy with goals to find correlations.

SELECT 
    player_name,
    TRY_CAST(shot_accuracy AS DECIMAL(5,2)) AS shot_accuracy,
    goals
FROM  [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]

------------------------------------------------------------------------------------------------

-----------10. Compute total goals and assists for each team.

SELECT 
    team,
    SUM(TRY_CAST(goals AS INT)) AS total_goals,
    SUM(TRY_CAST(assists AS INT)) AS total_assists
FROM  [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team;

----------------------------------------------------------------------------------------------
--------11. Count players by their marital status.

Select 
    marital_status,
Count(player_name) AS players
From [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
Group By marital_status;

-------------------------------------------------------------------------------------------------

-----12. Count players by nationality

Select nationality,
  COUNT (player_name) AS players
From  [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
Group By nationality;

----------------------------------------------------------------------------------------------
-----13. Find average market value grouped by nationality------

Select Nationality,
   AVG(CAST (market_value_zar AS FLOAT)) AS average_market_value
From [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
Group By nationality;

----------------------------------------------------------------------------------------------
--------14. Determine how many player contracts end in each year.

SELECT 
    contract_end_year,
    COUNT(*) AS contracts_ending
FROM [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY contract_end_year
ORDER BY contract_end_year;

----------------------------------------------------------------------------------------------

-----------------15. Identify players whose contracts end next year.

SELECT 
    player_name,
    team,
    contract_end_year
FROM [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
WHERE contract_end_year = YEAR(GETDATE()) + 1;

-----------------------------------------------------------------------------------------
---------16. Summarize the number of players by injury status.------

SELECT 
    injury_status,
    COUNT(*) AS number_of_players
FROM [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY injury_status
ORDER BY injury_status;

--------------------------------------------------------------------------------------------

---------------17. Calculate goals per match ratio for each player.--

SELECT 
    player_name,
    TRY_CAST(goals AS FLOAT) / NULLIF(TRY_CAST(matches_played AS FLOAT), 0) AS goals_per_match
FROM [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]

----------------------------------------------------------------------------------------------

--------18. Count how many players are managed by each agent.----

SELECT 
    agent,
    COUNT(player_name) AS number_of_players
FROM [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY agent
ORDER BY  COUNT(player_name) DESC;

-----------------------------------------------------------------------------------------------

-----------------19. Calculate average height and weight by player position.---

SELECT 
    position,
    AVG(TRY_CAST(height_cm AS FLOAT)) AS avg_height,
    AVG(TRY_CAST(weight_kg AS FLOAT)) AS avg_weight
FROM [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position
ORDER BY position;

------------------------------------------------------------------------------------------------

-----------------20. Identify players with the highest combined goals and assists.---

SELECT 
    player_name,
    team,
    TRY_CAST(goals AS INT) + TRY_CAST(assists AS INT) AS total_contributions
FROM [Soccer Analysis DB1].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY TRY_CAST(goals AS INT) + TRY_CAST(assists AS INT)  DESC;

---------------------------------------------------------------------------------------------------
