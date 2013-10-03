describe('Loading', function() {
    it('should not fail on load', function() {
        expect(true).toBeTruthy();
    });

    it('should export ETALAB_VALIDATION_RULES', function() {
        expect(window.ETALAB_VALIDATION_RULES).toBeDefined();
    });
});

