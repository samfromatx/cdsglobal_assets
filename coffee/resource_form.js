(function(){var e,r,t;e=jQuery,t=localStorage.getItem("elqVEmail"),r=localStorage.getItem("elqProg2"),""!==t&&null!==t||"false"!==r&&""!==r&&null!==r?""!==t&&"false"===r?(e("#prog2").hide(),e("#prog2 input, #prog2 select, input[name='emailAddress']").each(function(){return e(this).removeAttr("required")}),console.log("if 2")):""!==t&&"true"===r&&(e("#prog1").hide(),e("#prog1 input, #prog1 select, input[name='emailAddress']").each(function(){return e(this).removeAttr("required")}),console.log("if 3")):(e("#prog1").hide(),e("#prog1 input, #prog1 select").each(function(){return e(this).removeAttr("required")}),e("#prog2").hide(),e("#prog2 input, #prog2 select").each(function(){return e(this).removeAttr("required")})),e("#elqForm").submit(function(e){return""!==t&&"false"===r?localStorage.setItem("elqProg2","true"):void 0}),e('select[name="country"]').change(function(){return"CA"===e(this).val()?(e("#GB").hide(),e("#GB input").prop("required",!1),e("#CA").show(),e("#CA input").prop("required",!0)):(e("#CA").hide(),e("#GB").hide(),e("#CA input").prop("required",!1),e("#GB input").prop("required",!1))})}).call(this);
//# sourceMappingURL=./resource_form.map