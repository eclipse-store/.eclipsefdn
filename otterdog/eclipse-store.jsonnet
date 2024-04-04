local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-store') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse Store",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: "********",
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: "********",
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: "********",
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: "********",
    },
  ],
  _repositories+:: [
    orgs.newRepo('bookstore-demo') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "EclipseStore BookStore Demo - Sample Application",
      has_discussions: true,
      homepage: "https://eclipsestore.io/",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('docs-site') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Docs",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "site",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "site"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('store') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "High-Performance Java-Native-Persistence. Store and load any Java Object Graph or Subgraphs partially, Relieved of Heavy-weight JPA. Microsecond Response Time. Ultra-High Throughput. Minimum of Latencies. Create Ultra-Fast In-Memory Database Applications & Microservices.",
      has_discussions: true,
      homepage: "https://eclipsestore.io/",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "in-memory-database",
        "in-memory-storage",
        "java",
        "object-graph",
        "persistence",
        "storage-engine"
      ],
      web_commit_signoff_required: false,
    },
  ],
}
