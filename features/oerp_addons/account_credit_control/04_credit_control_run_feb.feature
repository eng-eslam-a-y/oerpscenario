###############################################################################
#
#    OERPScenario, OpenERP Functional Tests
#    Copyright 2012 Camptocamp SA
#    Author Nicolas Bessi
##############################################################################

# Features Generic tags (none for all)
##############################################################################

@credit_control_run  @credit_control_run_feb

Feature: Ensure that mail credit line generation first pass is correct

  @credit_control_mark
  Scenario: mark lines
    Given there is "draft" credit lines
    And I mark all draft mail to state "to_be_sent"
    Then the draft line should be in state "to_be_sent"

  @credit_control_run_month
  Scenario: Create run
    Given I need a "credit.control.run" with oid: credit_control.run2
    And having:
      | name |      value |
      | date | 2012-02-29 |
    When I launch the credit run
    Then my credit run should be in state "done"
    And the generated credit lines should have the following values:
     | balance | date due   | account     | policy        | date       | partner        | canal | level | move line | policy level         | state | amount due | currency |
     | 360     | 2012-02-15 | Debtors     | 3 time policy | 2012-02-29 | customer_4     | mail  | 1     | SI_11     | 10 days net          | draft | 360        | USD      |
     | 1000    | 2012-02-17 | Debtors USD | 3 time policy | 2012-02-29 | customer_5_usd | mail  | 1     | SI_13     | 10 days net          | draft | 1000       | USD      |
     | 300     | 2012-01-18 | Debtors     | 3 time policy | 2012-02-29 | customer_4     | mail  | 2     | SI_10     | 30 days end of month | draft | 300        |          |

