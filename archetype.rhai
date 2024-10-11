let context = #{};

const PROGRAMMING_CASES = CasedIdentityAndValue([PascalCase, CamelCase, KebabCase, SnakeCase, TrainCase, ConstantCase]);

// Create project prefix variations
context += prompt("Project Prefix:", "project-prefix", #{
    placeholder: "Transaction",
    help: "Project Name",
    cases: [
        PROGRAMMING_CASES,
    ],
});

// Create project suffix variations
context += prompt("Project Suffix:", "project-suffix", #{
    type: Select(["Service", "Inferencer", "Orchestrator", "Adapter"]),
    help: "Project Type",
    defaults_with: "Service",
    cases: [
        PROGRAMMING_CASES,
    ],
});

context += prompt("Features:", "features", #{
    help: "Project Features",
    type: MultiSelect([
        "gRPC",
        "Neo4j",
        "AWS",
        "PyTorch",
    ]),
});

// Create case variations for the combined project prefix and suffix
context += set("project-name", render("{{ project-prefix }}-{{ project-suffix }}", context), #{
    cases: [
        PROGRAMMING_CASES,
        FixedKeyCasedValue("ProjectTitle", TitleCase),
    ],
});

// Generate content
Directory("content/base").render(context);


