import { acceptance } from "helpers/qunit-helpers";

acceptance("DiscoursePluginCm", { loggedIn: true });

test("DiscoursePluginCm works", async assert => {
  await visit("/admin/plugins/discourse-plugin-cm");

  assert.ok(false, "it shows the DiscoursePluginCm button");
});
