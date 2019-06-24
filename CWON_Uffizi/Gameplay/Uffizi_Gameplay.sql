
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
  BuildingType, GreatWorkSlotType, NumSlots
)
VALUES
  (
    'BUILDING_UFFIZI', 'GREATWORKSLOT_ART', 3
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


--Any City with Art Museum yields + 1 Culture
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('REQUIRES_CITY_HAS_ART_MUSEUM', 'REQUIREMENT_CITY_HAS_BUILDING');

INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQUIRES_CITY_HAS_ART_MUSEUM', 'BuildingType', 'BUILDING_MUSEUM_ART');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('CITY_HAS_ART_MUSEUM_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('CITY_HAS_ART_MUSEUM_REQUIREMENTS', 'REQUIRES_CITY_HAS_ART_MUSEUM');


INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES ('UFFIZI_ART_MUSEUM_CULTURE_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CITY_HAS_ART_MUSEUM_REQUIREMENTS');


INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('UFFIZI_ART_MUSEUM_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('UFFIZI_ART_MUSEUM_CULTURE_MODIFIER', 'Amount', '1');


INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_UFFIZI', 'UFFIZI_ART_MUSEUM_CULTURE_MODIFIER');




-- DO NOT COMMIT - Testing Only
DELETE FROM GreatWork_YieldChanges WHERE GreatWorkType IN (SELECT GreatWorkType FROM GreatWorks WHERE GreatWorkObjectType = 'GREATWORKOBJECT_ART');

DELETE FROM GreatWorks WHERE GreatWorkObjectType = 'GREATWORKOBJECT_ART';

DELETE FROM GreatPersonIndividuals WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_ARTIST';


-- Add Renaissance Great Artists - Botticelli, Raphael, Titian.
INSERT INTO Types
			(Type,										Kind)
VALUES		('GREAT_PERSON_INDIVIDUAL_CWON_BOTTICELLI',	'KIND_GREAT_PERSON_INDIVIDUAL'),
			('GREAT_PERSON_INDIVIDUAL_CWON_RAPHAEL',		'KIND_GREAT_PERSON_INDIVIDUAL'),
			('GREAT_PERSON_INDIVIDUAL_CWON_TITIAN',	'KIND_GREAT_PERSON_INDIVIDUAL'),
			('GREATWORK_CWON_BOTTICELLI_1',						'KIND_GREATWORK'),
			('GREATWORK_CWON_BOTTICELLI_2',						'KIND_GREATWORK'),
			('GREATWORK_CWON_BOTTICELLI_3',						'KIND_GREATWORK'),
			('GREATWORK_CWON_RAPHAEL_1',						'KIND_GREATWORK'),
			('GREATWORK_CWON_RAPHAEL_2',						'KIND_GREATWORK'),
			('GREATWORK_CWON_RAPHAEL_3',						'KIND_GREATWORK'),
			('GREATWORK_CWON_TITIAN_1',						'KIND_GREATWORK'),
			('GREATWORK_CWON_TITIAN_2',						'KIND_GREATWORK'),
			('GREATWORK_CWON_TITIAN_3',						'KIND_GREATWORK');

INSERT INTO GreatPersonIndividuals
			(GreatPersonIndividualType,						Name,													GreatPersonClassType,			EraType,			Gender,	ActionCharges)
VALUES
			('GREAT_PERSON_INDIVIDUAL_CWON_BOTTICELLI',	'LOC_GREAT_PERSON_INDIVIDUAL_CWON_BOTTICELLI_NAME',	'GREAT_PERSON_CLASS_ARTIST',	'ERA_RENAISSANCE',	'M',	0),
			('GREAT_PERSON_INDIVIDUAL_CWON_RAPHAEL',	'LOC_GREAT_PERSON_INDIVIDUAL_CWON_RAPHAEL_NAME',	'GREAT_PERSON_CLASS_ARTIST',	'ERA_RENAISSANCE',	'M',	0),
			('GREAT_PERSON_INDIVIDUAL_CWON_TITIAN',		'LOC_GREAT_PERSON_INDIVIDUAL_CWON_TITIAN_NAME',		'GREAT_PERSON_CLASS_ARTIST',	'ERA_RENAISSANCE',	'M',	0);

INSERT INTO GreatWorks
			(GreatWorkType,					GreatWorkObjectType,			GreatPersonIndividualType,						Name,											Quote,										Tourism,	Audio)
VALUES		('GREATWORK_CWON_BOTTICELLI_1',	'GREATWORKOBJECT_RELIGIOUS',		'GREAT_PERSON_INDIVIDUAL_CWON_BOTTICELLI',		'LOC_GREATWORK_CWON_BOTTICELLI_1_NAME',			'GREATWORK_CWON_BOTTICELLI_1_IMAGE',	4,			''),
			('GREATWORK_CWON_BOTTICELLI_2',	'GREATWORKOBJECT_RELIGIOUS',		'GREAT_PERSON_INDIVIDUAL_CWON_BOTTICELLI',		'LOC_GREATWORK_CWON_BOTTICELLI_2_NAME',			'GREATWORK_CWON_BOTTICELLI_2_IMAGE',	4,			''),
			('GREATWORK_CWON_BOTTICELLI_3',	'GREATWORKOBJECT_PORTRAIT',		'GREAT_PERSON_INDIVIDUAL_CWON_BOTTICELLI',		'LOC_GREATWORK_CWON_BOTTICELLI_3_NAME',			'GREATWORK_CWON_BOTTICELLI_3_IMAGE',	4,			''),
			('GREATWORK_CWON_RAPHAEL_1',	'GREATWORKOBJECT_PORTRAIT',		'GREAT_PERSON_INDIVIDUAL_CWON_RAPHAEL',	'LOC_GREATWORK_CWON_RAPHAEL_1_NAME',	'GREATWORK_CWON_RAPHAEL_1_IMAGE',	4,	''),
			('GREATWORK_CWON_RAPHAEL_2',	'GREATWORKOBJECT_RELIGIOUS',		'GREAT_PERSON_INDIVIDUAL_CWON_RAPHAEL',	'LOC_GREATWORK_CWON_RAPHAEL_2_NAME',	'GREATWORK_CWON_RAPHAEL_2_IMAGE',	4,	''),
			('GREATWORK_CWON_RAPHAEL_3',	'GREATWORKOBJECT_LANDSCAPE',		'GREAT_PERSON_INDIVIDUAL_CWON_RAPHAEL',	'LOC_GREATWORK_CWON_RAPHAEL_3_NAME',	'GREATWORK_CWON_RAPHAEL_3_IMAGE',	4,	''),
			('GREATWORK_CWON_TITIAN_1',	'GREATWORKOBJECT_PORTRAIT',		'GREAT_PERSON_INDIVIDUAL_CWON_TITIAN',		'LOC_GREATWORK_CWON_TITIAN_1_NAME',			'GREATWORK_CWON_TITIAN_1_IMAGE',		4,			''),
			('GREATWORK_CWON_TITIAN_2',	'GREATWORKOBJECT_LANDSCAPE',		'GREAT_PERSON_INDIVIDUAL_CWON_TITIAN',		'LOC_GREATWORK_CWON_TITIAN_2_NAME',			'GREATWORK_CWON_TITIAN_2_IMAGE',		4,			''),
			('GREATWORK_CWON_TITIAN_3',	'GREATWORKOBJECT_RELIGIOUS',		'GREAT_PERSON_INDIVIDUAL_CWON_TITIAN',		'LOC_GREATWORK_CWON_TITIAN_3_NAME',			'GREATWORK_CWON_TITIAN_3_IMAGE',		4,			'');

INSERT INTO GreatWork_YieldChanges
			(GreatWorkType,					YieldType,			YieldChange)
VALUES		
			('GREATWORK_CWON_BOTTICELLI_1',	'YIELD_CULTURE',	3),
			('GREATWORK_CWON_BOTTICELLI_2',	'YIELD_CULTURE',	3),
			('GREATWORK_CWON_BOTTICELLI_3',	'YIELD_CULTURE',	3),
			('GREATWORK_CWON_RAPHAEL_1',	'YIELD_CULTURE',	3),
			('GREATWORK_CWON_RAPHAEL_2',	'YIELD_CULTURE',	3),
			('GREATWORK_CWON_RAPHAEL_3',	'YIELD_CULTURE',	3),
			('GREATWORK_CWON_TITIAN_1',	'YIELD_CULTURE',	3),
			('GREATWORK_CWON_TITIAN_2',	'YIELD_CULTURE',	3),
			('GREATWORK_CWON_TITIAN_3',	'YIELD_CULTURE',	3);