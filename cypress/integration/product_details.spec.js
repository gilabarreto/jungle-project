describe('product details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("Navigate from the home page to the product detail page by clicking on a product", () => {
    cy.get('.products article').first().click()
    cy.contains("Scented Blade")
  });
})