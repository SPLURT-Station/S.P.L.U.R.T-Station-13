//include unit test files in this module in this ifdef
//Keep this sorted alphabetically

#if defined(UNIT_TESTS) || defined(SPACEMAN_DMM)

/// For advanced cases, fail unconditionally but don't return (so a test can return multiple results)
#define TEST_FAIL(reason) (Fail(reason || "No reason", __FILE__, __LINE__))

/// Asserts that a condition is true
/// If the condition is not true, fails the test
#define TEST_ASSERT(assertion, reason) if (!(assertion)) { return Fail("Assertion failed: [reason || "No reason"]", __FILE__, __LINE__) }

/// Asserts that a parameter is not null
#define TEST_ASSERT_NOTNULL(a, reason) if (isnull(a)) { return Fail("Expected non-null value: [reason || "No reason"]", __FILE__, __LINE__) }

/// Asserts that a parameter is null
#define TEST_ASSERT_NULL(a, reason) if (!isnull(a)) { return Fail("Expected null value but received [a]: [reason || "No reason"]", __FILE__, __LINE__) }

/// Asserts that the two parameters passed are equal, fails otherwise
/// Optionally allows an additional message in the case of a failure
#define TEST_ASSERT_EQUAL(a, b, message) do { \
	var/lhs = ##a; \
	var/rhs = ##b; \
	if (lhs != rhs) { \
		return Fail("Expected [isnull(lhs) ? "null" : lhs] to be equal to [isnull(rhs) ? "null" : rhs].[message ? " [message]" : ""]", __FILE__, __LINE__); \
	} \
} while (FALSE)

/// Asserts that the two parameters passed are not equal, fails otherwise
/// Optionally allows an additional message in the case of a failure
#define TEST_ASSERT_NOTEQUAL(a, b, message) do { \
	var/lhs = ##a; \
	var/rhs = ##b; \
	if (lhs == rhs) { \
		return Fail("Expected [isnull(lhs) ? "null" : lhs] to not be equal to [isnull(rhs) ? "null" : rhs].[message ? " [message]" : ""]", __FILE__, __LINE__); \
	} \
} while (FALSE)

/// *Only* run the test provided within the parentheses
/// This is useful for debugging when you want to reduce noise, but should never be pushed
/// Intended to be used in the manner of `TEST_FOCUS(/datum/unit_test/math)`
#define TEST_FOCUS(test_path) ##test_path { focus = TRUE; }

/// Constants indicating unit test completion status
#define UNIT_TEST_PASSED 0
#define UNIT_TEST_FAILED 1
#define UNIT_TEST_SKIPPED 2

#define TEST_PRE 0
#define TEST_DEFAULT 1
/// After most test steps, used for tests that run long so shorter issues can be noticed faster
#define TEST_LONGER 10
/// This must be the last test to run due to the inherent nature of the test iterating every single tangible atom in the game and qdeleting all of them (while taking long sleeps to make sure the garbage collector fires properly) taking a large amount of time.
#define TEST_CREATE_AND_DESTROY INFINITY

/// Change color to red on ANSI terminal output, if enabled with -DANSICOLORS.
#ifdef ANSICOLORS
#define TEST_OUTPUT_RED(text) "\x1B\x5B1;31m[text]\x1B\x5B0m"
#else
#define TEST_OUTPUT_RED(text) (text)
#endif
/// Change color to green on ANSI terminal output, if enabled with -DANSICOLORS.
#ifdef ANSICOLORS
#define TEST_OUTPUT_GREEN(text) "\x1B\x5B1;32m[text]\x1B\x5B0m"
#else
#define TEST_OUTPUT_GREEN(text) (text)
#endif

/// A trait source when adding traits through unit tests
#define TRAIT_SOURCE_UNIT_TESTS "unit_tests"

#include "anchored_mobs.dm"
#include "bespoke_id.dm"
#include "binary_insert.dm"
// #include "bloody_footprints.dm"
// #include "breath.dm"
// #include "card_mismatch.dm"
#include "chain_pull_through_space.dm"
// #include "combat.dm"
#include "component_tests.dm"
// #include "connect_loc.dm"
// #include "confusion.dm"
// #include "crayons.dm"
#include "create_and_destroy.dm"
// #include "designs.dm"
#include "dynamic_ruleset_sanity.dm"
// #include "egg_glands.dm"
// #include "dynamic_ruleset_sanity.dm"
// #include "emoting.dm"
// #include "food_edibility_check.dm"
// #include "greyscale_config.dm"
// #include "heretic_knowledge.dm"
// #include "holidays.dm"
// #include "hydroponics_harvest.dm"
// #include "keybinding_init.dm"
// #include "language_transfer.dm"
#include "machine_disassembly.dm"
#include "medical_wounds.dm"
#include "merge_type.dm"
// #include "metabolizing.dm"
#include "modular_map_loader.dm" //SPLURT EDIT
// #include "ntnetwork_tests.dm"
// #include "outfit_sanity.dm"
// #include "pills.dm"
// #include "plantgrowth_tests.dm"
// #include "projectiles.dm"
// #include "rcd.dm"
#include "reagent_id_typos.dm"
// #include "reagent_mod_expose.dm"
// #include "reagent_mod_procs.dm"
#include "reagent_recipe_collisions.dm"
#include "resist.dm"
// #include "say.dm"
// #include "security_officer_distribution.dm"
// #include "serving_tray.dm"
// #include "siunit.dm"
#include "spawn_humans.dm"
#include "spawn_mobs.dm"
// #include "species_whitelists.dm"
// #include "stomach.dm"
// #include "strippable.dm"
#include "subsystem_init.dm"
#include "surgeries.dm"
#include "teleporters.dm"
#include "tgui_create_message.dm"
#include "timer_sanity.dm"
#include "unit_test.dm"
// #include "wizard.dm"

/// CIT TESTS
#include "character_saving.dm"

/// SANDSTORM TESTS
#include "interactions.dm" //No regrets

#ifdef REFERENCE_TRACKING_DEBUG //Don't try and parse this file if ref tracking isn't turned on. IE: don't parse ref tracking please mr linter
#include "find_reference_sanity.dm"
#endif

#undef TEST_ASSERT
#undef TEST_ASSERT_EQUAL
#undef TEST_ASSERT_NOTEQUAL
//#undef TEST_FOCUS - This define is used by vscode unit test extension to pick specific unit tests to run and appended later so needs to be used out of scope here
#endif
