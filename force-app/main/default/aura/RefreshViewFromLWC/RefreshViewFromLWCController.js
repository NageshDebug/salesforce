({
    onRefreshView: function (component, event, helper) {
        document.dispatchEvent(new CustomEvent("lwc://refreshView"));
    },

    onInit: function (component, event, helper) {
        document.addEventListener("aura://refreshView", () => {
            $A.get('e.force:refreshView').fire();
        });
    }
});