module app;

import std.algorithm : canFind;
import std.array : appender, join;
import std.conv : parse, text, to;
import std.exception : enforce;
import std.format : format;
import std.stdio : stderr, writeln;
import std.string : replace;

immutable string[] DEV_TYPES = [
    "backend", "frontend", "fullstack", "data_science", "dev_ops",
    "blockchain", "machine_learning", "systems_programming", "game_development", "security"
];
immutable string[] JARGON_LEVELS = ["low", "medium", "high", "extreme"];
immutable string[] COMPLEXITIES = ["low", "medium", "high", "extreme"];
immutable string[] OUTPUT_FORMATS = ["text", "json"];
immutable string[] CLASSIC_SIX = [
    "code_analyzer", "data_processing", "jargon", "metrics", "network_activity", "system_monitoring"
];
immutable string[] MODERN_CORE = [
    "agent_workflows", "ai_inference_ops", "platform_engineering", "supply_chain_security",
    "observability_ai_runtime", "delivery_preview_ops", "evaluation_and_guardrails",
    "knowledge_retrieval", "edge_client_runtime", "identity_and_trust", "aibom_provenance",
    "agent_boundary_security", "embedded_agentic_pipeline", "data_governance_compliance", "finops_capacity"
];
immutable string[] LATER_FAMILIES = [
    "blockchain_protocol_ops", "cross_chain_interop", "proof_and_sequencer_ops", "hybrid_runtime_ops",
    "capacity_cost_controller", "batch_execution_tuner", "compiler_maintainer", "interop_adapter_engineer",
    "preflight_capacity_planner", "simulator_performance_engineer", "fhir_profile_generator",
    "smart_launch_oauth", "bulk_fhir_population_ops", "hl7v2_feed_ops", "clinical_workflow_events",
    "dicomweb_imaging_ops", "openehr_semantic_record_ops", "device_telemetry_clinical",
    "emr_vendor_adapter", "ocpp_chargepoint_ops", "ocpi_roaming_ops", "mcp_a2a_ops",
    "streaming_bus_ops", "service_mesh_rpc_ops"
];

struct Config {
    string devType = "backend";
    string jargon = "medium";
    string complexity = "medium";
    ulong duration = 1;
    bool alerts;
    string project = "distributed-cluster";
    bool minimal;
    bool team;
    string framework;
    ulong seed = 0;
    bool hasSeed;
    string outputFormat = "text";
    bool noColor;
    bool trace;
    string focusFamily;
}

struct Rng {
    ulong state;

    this(ulong seed) {
        state = seed == 0 ? 0x9E3779B97F4A7C15UL : seed;
    }

    ulong next() {
        state = state * 6364136223846793005UL + 1442695040888963407UL;
        return state;
    }

    size_t choose(size_t limit) {
        return cast(size_t)(next() % limit);
    }
}

int main(string[] args) {
    try {
        auto config = parseArgs(args[1 .. $]);
        if (config.outputFormat == "json" && args[1 .. $].canFind("--list-values")) {
            writeln(listValuesJson());
            return 0;
        }
        if (args[1 .. $].canFind("--list-values")) {
            writeln(listValuesJson());
            return 0;
        }
        run(config);
        return 0;
    } catch (Exception ex) {
        stderr.writeln("d-stakeholder: ", ex.msg);
        return 2;
    }
}

Config parseArgs(string[] args) {
    Config config;
    for (size_t i = 0; i < args.length; i++) {
        string arg = args[i];
        string value(string name) {
            enforce(i + 1 < args.length, name ~ " requires a value");
            return args[++i];
        }
        switch (arg) {
            case "--dev-type", "-d": config.devType = normalize(value(arg)); break;
            case "--jargon", "-j": config.jargon = normalize(value(arg)); break;
            case "--complexity", "-c": config.complexity = normalize(value(arg)); break;
            case "--duration", "-T": config.duration = value(arg).to!ulong; break;
            case "--alerts", "-a": config.alerts = true; break;
            case "--project", "-p": config.project = value(arg); break;
            case "--minimal": config.minimal = true; break;
            case "--team", "-t": config.team = true; break;
            case "--framework", "-F": config.framework = value(arg); break;
            case "--seed": config.seed = value(arg).to!ulong; config.hasSeed = true; break;
            case "--output-format": config.outputFormat = normalize(value(arg)); break;
            case "--no-color": config.noColor = true; break;
            case "--trace": config.trace = true; break;
            case "--focus-family": config.focusFamily = normalize(value(arg)); break;
            case "--list-values": break;
            case "--experimental-provider":
                auto provider = value(arg);
                throw new Exception("experimental provider '" ~ provider ~ "' is not implemented in Tranche D; gap=d.experimental-provider-fail-fast");
            default:
                throw new Exception("unknown argument " ~ arg);
        }
    }
    enforce(DEV_TYPES.canFind(config.devType), "invalid --dev-type " ~ config.devType);
    enforce(JARGON_LEVELS.canFind(config.jargon), "invalid --jargon " ~ config.jargon);
    enforce(COMPLEXITIES.canFind(config.complexity), "invalid --complexity " ~ config.complexity);
    enforce(OUTPUT_FORMATS.canFind(config.outputFormat), "invalid --output-format " ~ config.outputFormat);
    if (config.focusFamily.length) enforce(allFamilies().canFind(config.focusFamily), "invalid --focus-family " ~ config.focusFamily);
    return config;
}

string normalize(string value) {
    return value.replace("-", "_");
}

void run(Config config) {
    auto rng = Rng(config.hasSeed ? config.seed : 20260515UL);
    ulong sequence = 1;
    if (config.outputFormat == "json") {
        writeln(eventJson("session.start", sequence++, "starting 2026+ source-evolution session for " ~ config.project, "", config, null));
    } else {
        writeln("2026+ source-evolution session for " ~ config.project);
        writeln("mode=" ~ config.devType ~ " jargon=" ~ config.jargon ~ " complexity=" ~ activityCount(config.complexity).text ~ " output=" ~ config.outputFormat);
        if (config.hasSeed) writeln("seed=" ~ config.seed.text);
        if (config.focusFamily.length) writeln("focus-family=" ~ config.focusFamily);
    }

    auto families = selectedFamilies(config, rng);
    foreach (family; families) {
        auto message = renderFamily(family, config, rng);
        if (config.outputFormat == "json") {
            writeln(eventJson("activity", sequence++, message, family, config, null));
            if (config.trace) writeln(eventJson("trace", sequence++, "scheduled " ~ family ~ " with deterministic catalog routing", family, config, "trace"));
        } else {
            writeln("[" ~ title(family) ~ "] " ~ message);
            if (config.trace) writeln("[trace] scheduled " ~ family ~ " with deterministic catalog routing");
        }
    }

    if (config.outputFormat == "json") {
        writeln(eventJson("session.end", sequence, "session terminated (duration-elapsed)", "", config, null));
    } else {
        writeln("session terminated (duration-elapsed)");
    }
}

string[] selectedFamilies(Config config, ref Rng rng) {
    if (config.focusFamily.length) return [config.focusFamily];
    auto catalog = CLASSIC_SIX ~ MODERN_CORE;
    string[] selected;
    auto count = activityCount(config.complexity);
    foreach (n; 0 .. count) selected ~= catalog[(rng.choose(catalog.length) + n) % catalog.length];
    if (config.alerts) selected ~= "supply_chain_security";
    if (config.team) selected ~= "agent_workflows";
    return selected;
}

size_t activityCount(string complexity) {
    switch (complexity) {
        case "low": return 1;
        case "medium": return 2;
        case "high": return 3;
        case "extreme": return 4;
        default: return 2;
    }
}

string renderFamily(string family, Config config, ref Rng rng) {
    immutable detail = ["low": "steady", "medium": "coordinated", "high": "multi-stage", "extreme": "cross-domain"];
    auto level = detail[config.complexity];
    switch (family) {
        case "code_analyzer": return level ~ " static analysis pass correlating ownership, risk, and generated remediation hints for " ~ config.devType;
        case "data_processing": return level ~ " data pipeline replay normalizing batches, schema drift, and checkpoint evidence";
        case "jargon": return config.jargon ~ " jargon synthesis aligning stakeholder language with deterministic engineering signals";
        case "metrics": return level ~ " metrics sweep tracking latency, saturation, spend, and regression deltas";
        case "network_activity": return level ~ " network flow simulation over API, RPC, and service-mesh request paths";
        case "system_monitoring": return level ~ " system monitor cycle evaluating health, capacity, and rollout risk";
        case "agent_workflows": return level ~ " agent workflow orchestration with review gates, handoffs, and rollback notes";
        case "ai_inference_ops": return level ~ " inference operations pass balancing model routing, token budgets, and quality signals";
        case "platform_engineering": return level ~ " platform engineering rollout across runners, environments, and release controls";
        case "supply_chain_security": return level ~ " supply-chain security review over provenance, signing, and dependency boundaries";
        case "observability_ai_runtime": return level ~ " AI runtime observability pass joining traces, prompts, and evaluation telemetry";
        case "delivery_preview_ops": return level ~ " preview delivery workflow validating ephemeral environments and stakeholder demos";
        case "evaluation_and_guardrails": return level ~ " guardrail evaluation run comparing policy checks, claims, and regression fixtures";
        case "knowledge_retrieval": return level ~ " retrieval pipeline audit ranking sources, embeddings, and answer provenance";
        case "edge_client_runtime": return level ~ " edge client runtime pass syncing offline state, feature flags, and telemetry windows";
        case "identity_and_trust": return level ~ " identity and trust review over auth boundaries, session posture, and attestations";
        case "aibom_provenance": return level ~ " AIBOM provenance assembly linking prompts, models, datasets, and release evidence";
        case "agent_boundary_security": return level ~ " agent boundary security pass constraining tool access, secrets, and delegated actions";
        case "embedded_agentic_pipeline": return level ~ " embedded agentic pipeline dry-run joining local actions with supervised automation";
        case "data_governance_compliance": return level ~ " data governance checkpoint reconciling retention, consent, and regional policy";
        case "finops_capacity": return level ~ " FinOps capacity review balancing queues, budgets, and accelerator availability";
        default: return "grouped fallback for later family " ~ family ~ " with deterministic fail-visible coverage";
    }
}

string listValuesJson() {
    return `{"devTypes":` ~ jsonArray(DEV_TYPES) ~ `,"jargonLevels":` ~ jsonArray(JARGON_LEVELS) ~
        `,"complexities":` ~ jsonArray(COMPLEXITIES) ~ `,"outputFormats":` ~ jsonArray(OUTPUT_FORMATS) ~
        `,"flags":["alerts","project","minimal","team","framework","seed","output-format","no-color","trace","list-values","focus-family","experimental-provider"],"generatorFamilies":` ~ jsonArray(allFamilies()) ~ `}`;
}

immutable(string)[] allFamilies() {
    return CLASSIC_SIX ~ MODERN_CORE ~ LATER_FAMILIES;
}

string eventJson(string eventType, ulong sequence, string message, string family, Config config, string traceKind) {
    auto outp = appender!string();
    outp.put(`{"eventType":"` ~ escape(eventType) ~ `","sequence":` ~ sequence.text ~ `,"message":"` ~ escape(message) ~ `","timestamp":"T+` ~ format("%06d", sequence * 137) ~ `ms"`);
    if (family.length) outp.put(`,"family":"` ~ escape(family) ~ `"`);
    outp.put(`,"generationProvenance":{"sourceRepo":"rust-stakeholder","baseline":"2026-plus-source-evolution","experimental":false,"adapterType":"static-catalog"}`);
    outp.put(`,"context":{"project":"` ~ escape(config.project) ~ `","devType":"` ~ escape(config.devType) ~ `","jargon":"` ~ escape(config.jargon) ~ `","complexity":"` ~ escape(config.complexity) ~ `"`);
    if (config.hasSeed) outp.put(`,"seed":` ~ config.seed.text);
    if (config.framework.length) outp.put(`,"framework":"` ~ escape(config.framework) ~ `"`);
    if (traceKind.length) outp.put(`,"kind":"` ~ traceKind ~ `"`);
    outp.put(`}}`);
    return outp.data;
}

string jsonArray(const string[] values) {
    return `[` ~ values.mapJson().join(",") ~ `]`;
}

string[] mapJson(const string[] values) {
    string[] mapped;
    foreach (value; values) mapped ~= `"` ~ escape(value) ~ `"`;
    return mapped;
}

string escape(string value) {
    return value.replace(`\`, `\\`).replace(`"`, `\"`);
}

string title(string family) {
    auto parts = family.replace("_", " ");
    return parts.length ? parts[0 .. 1].toUpperAscii ~ parts[1 .. $] : family;
}

string toUpperAscii(string value) {
    import std.ascii : toUpper;
    string result;
    foreach (ch; value) result ~= ch.toUpper;
    return result;
}

unittest {
    auto values = listValuesJson();
    assert(values.canFind(`"code_analyzer"`));
    assert(values.canFind(`"focus-family"`));
    assert(values.canFind(`"experimental-provider"`));
}

unittest {
    auto config = parseArgs(["--output-format", "json", "--seed", "42", "--focus-family", "metrics"]);
    assert(config.outputFormat == "json");
    assert(config.hasSeed && config.seed == 42);
    assert(config.focusFamily == "metrics");
}

unittest {
    auto config = Config("security", "high", "extreme", 1, true, "demo", true, true, "mcp", 7, true, "json", true, true, "");
    auto rngA = Rng(config.seed);
    auto rngB = Rng(config.seed);
    assert(selectedFamilies(config, rngA) == selectedFamilies(config, rngB));
}
