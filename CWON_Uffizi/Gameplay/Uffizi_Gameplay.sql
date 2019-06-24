/*
  Civilization
  Authors: Deliverator
*/

INSERT INTO Types (Type, Kind) VALUES ('BUILDING_UFFIZI', 'KIND_BUILDING');

INSERT INTO Buildings (BuildingType, Name, Description, PrereqTech, Cost, AdvisorType, MaxWorldInstances, IsWonder, RequiresPlacement, Quote, AdjacentDistrict)
VALUES ('BUILDING_UFFIZI', 'LOC_BUILDING_UFFIZI_NAME', 'LOC_BUILDING_UFFIZI_DESCRIPTION', 'TECH_BANKING', 920, 'ADVISOR_CULTURE', '1', 1, 1, 'LOC_BUILDING_UFFIZI_QUOTE', 'DISTRICT_CITY_CENTER');

INSERT INTO BuildingPrereqs (Building, PrereqBuilding) VALUES ('BUILDING_UFFIZI', 'BUILDING_BANK');

INSERT INTO Building_YieldChanges (BuildingType, YieldType, YieldChange) VALUES  ('BUILDING_UFFIZI', 'YIELD_CULTURE', 2);

INSERT INTO Building_ValidTerrains (BuildingType, TerrainType)
VALUES
  (
    'BUILDING_UFFIZI', 'TERRAIN_GRASS'
  ),
  (
    'BUILDING_UFFIZI', 'TERRAIN_PLAINS'
  );

INSERT INTO Building_GreatWorks (
  BuildingType, GreatWorkSlotType,
  NumSlots, ThemingUniquePerson, ThemingSameObjectType,
  ThemingUniqueCivs, ThemingSameEras,
   ThemingYieldMultiplier, ThemingTourismMultiplier, NonUniquePersonYield, NonUniquePersonTourism, ThemingBonusDescription
)
VALUES
  (
    'BUILDING_UFFIZI', 'GREATWORKSLOT_ART',
    3, 0, 0, 0, 1, 100, 100, 1, 1, 'LOC_UFFIZI_THEMINGBONUS_ART'
  );

-- 1 free Great Artist appears near the city where the wonder was built
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('REQUIRES_PLAYER_CAN_EVER_EARN_ARTIST', 'REQUIREMENT_PLAYER_CAN_EVER_EARN_GREAT_PERSON_CLASS');

INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQUIRES_PLAYER_CAN_EVER_EARN_ARTIST', 'GreatPersonClass', 'GREAT_PERSON_CLASS_ARTIST');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('UFFIZI_ARTIST_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('UFFIZI_ARTIST_REQUIREMENTS', 'REQUIRES_PLAYER_CAN_EVER_EARN_ARTIST');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, RunOnce, Permanent)
VALUES ('UFFIZI_GRANT_ARTIST', 'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY', 'UFFIZI_ARTIST_REQUIREMENTS', 1, 1);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('UFFIZI_GRANT_ARTIST', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_ARTIST');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('UFFIZI_GRANT_ARTIST', 'Amount', '1');


INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_UFFIZI', 'UFFIZI_GRANT_ARTIST');
