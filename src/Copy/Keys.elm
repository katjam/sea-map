module Copy.Keys exposing (Key(..))


type Key
    = SiteTitle
      --- Internal Href slugs
    | NotAlonePageSlug
    | DefinitionPageSlug
    | GetHelpPageSlug
    | HelpSelfGridPageSlug
    | HelpSelfSinglePageSlug String
    | HelpSelfBankingSlug
    | HelpSelfDebtSlug
    | HelpSelfHousingSlug
    | HelpSelfFinancialSlug
    | HelpSelfCovidSlug
    | HelpSelfInfoLawSlug
    | HelpSelfSeparatingSlug
      --- External Hrefs
    | DomesticAbuseHref
    | WomensAidHref
    | SeaSurvivorForumHref
      -- Resource pdfs
    | SeaOrganisationsResourceHref
    | HelpSelfBankingResource1Href
    | HelpSelfBankingResource2Href
    | HelpSelfDebtResource1Href
    | HelpSelfDebtResource2Href
    | HelpSelfDebtResource3Href
    | HelpSelfHousingResource1Href
    | HelpSelfFinancialResource1Href
    | HelpSelfFinancialResource2Href
    | HelpSelfFinancialResource3Href
    | HelpSelfCovidResource1Href
    | HelpSelfCovidResource2Href
    | HelpSelfInfoLawResource1Href
    | HelpSelfInfoLawResource2Href
    | HelpSelfSeparatingResource1Href
    | HelpSelfSeparatingResource2Href
      -- Not Alone page
    | NotAloneTitle
    | Journey1Teaser
    | Journey1Relatable
    | Journey1Hopeful
    | Journey1Statement
    | Journey2Teaser
    | Journey2Relatable
    | Journey2Hopeful
    | Journey2Statement
    | Journey3Teaser
    | Journey3Relatable
    | Journey3Hopeful
    | Journey3Statement
    | Journey4Teaser
    | Journey4Relatable
    | Journey4Hopeful
    | Journey4Statement
    | Journey5Teaser
    | Journey5Relatable
    | Journey5Hopeful
    | Journey5Statement
    | Journey6Teaser
    | Journey6Relatable
    | Journey6Hopeful
    | Journey6Statement
    | ExpandQuoteButton
    | ToDefinitionReassuringText
    | ToDefinitionFromNotAloneLink
    | EmergencyButton
    | EmergencyReassure
    | EmergencyPoliceInfo
    | EmergencyNotImmediateReassure
    | EmergencyDomesticAbuseLink
    | EmergencyDomesticAbuseInfo
    | EmergencyWomensAidLink
    | EmergencyWomensAidInfo
    | EmergencyOtherOrganisationsLink
      -- Definition page
    | DefinitionTitle
    | DefinitionConciseP1
    | DefinitionConciseP2
    | DefinitionConciseP3
    | DefinitionConciseP4
    | DefinitionGetHelpLink
    | DefinitionCategory1Title
    | DefinitionCategory1Info
    | DefinitionCategory1Quote1
    | DefinitionCategory1Quote2
    | DefinitionCategory2Title
    | DefinitionCategory2Info
    | DefinitionCategory2Quote1
    | DefinitionCategory2Quote2
    | DefinitionCategory3Title
    | DefinitionCategory3Info
    | DefinitionCategory3Quote1
    | DefinitionCategory3Quote2
    | DefinitionCategory4Title
    | DefinitionCategory4Info
    | DefinitionCategory4Quote1
    | DefinitionCategory4Quote2
    | DefinitionCategory5Title
    | DefinitionCategory5Info
    | DefinitionCategory5Quote1
    | DefinitionCategory5Quote2
    | DefinitionCategory6Title
    | DefinitionCategory6Info
    | DefinitionCategory6Quote1
    | DefinitionCategory6Quote2
    | SplitterAffirmation
    | ToGetHelpFromDefinitionLink
    | ToHelpSelfFromDefinitionLink
      -- Help Self grid page
    | HelpSelfTitle
    | HelpSelfBankingLink
    | HelpSelfDebtLink
    | HelpSelfHousingLink
    | HelpSelfFinancialLink
    | HelpSelfCovidLink
    | HelpSelfInfoLawLink
    | HelpSelfSeparatingLink
    | ToDefinitionFromHelpSelfLink
    | ToNotAloneFromHelpSelfLink
    | ToGetHelpFromHelpSelfLink
    | ToHelpSelfFromSingleCategoryLink
    | HelpSelfPdfDownloadLabel
      -- Help Self single Category 404
    | HelpSelfCategoryNotFoundTitle
      -- Help Self single Banking
    | HelpSelfBankingTitle
    | HelpSelfBankingResource1Title
    | HelpSelfBankingResource1Quote1
    | HelpSelfBankingResource1Quote2
    | HelpSelfBankingResource1Summary
    | HelpSelfBankingResource1Link
    | HelpSelfBankingResource2Title
    | HelpSelfBankingResource2Quote1
    | HelpSelfBankingResource2Quote2
    | HelpSelfBankingResource2Summary
    | HelpSelfBankingResource2Link
      -- Help Self single Debt
    | HelpSelfDebtTitle
    | HelpSelfDebtResource1Title
    | HelpSelfDebtResource1Quote1
    | HelpSelfDebtResource1Quote2
    | HelpSelfDebtResource1Summary
    | HelpSelfDebtResource1Link
    | HelpSelfDebtResource2Title
    | HelpSelfDebtResource2Quote1
    | HelpSelfDebtResource2Quote2
    | HelpSelfDebtResource2Summary
    | HelpSelfDebtResource2Link
    | HelpSelfDebtResource3Title
    | HelpSelfDebtResource3Quote1
    | HelpSelfDebtResource3Quote2
    | HelpSelfDebtResource3Summary
    | HelpSelfDebtResource3Link
      -- Help Self single Housing
    | HelpSelfHousingTitle
    | HelpSelfHousingResource1Title
    | HelpSelfHousingResource1Quote1
    | HelpSelfHousingResource1Quote2
    | HelpSelfHousingResource1Summary
    | HelpSelfHousingResource1Link
      -- Help Self single Financial Support
    | HelpSelfFinancialTitle
    | HelpSelfFinancialResource1Title
    | HelpSelfFinancialResource1Quote1
    | HelpSelfFinancialResource1Quote2
    | HelpSelfFinancialResource1Summary
    | HelpSelfFinancialResource1Link
    | HelpSelfFinancialResource2Title
    | HelpSelfFinancialResource2Quote1
    | HelpSelfFinancialResource2Quote2
    | HelpSelfFinancialResource2Summary
    | HelpSelfFinancialResource2Link
    | HelpSelfFinancialResource3Title
    | HelpSelfFinancialResource3Quote1
    | HelpSelfFinancialResource3Quote2
    | HelpSelfFinancialResource3Summary
    | HelpSelfFinancialResource3Link
      -- Help Self single Covid
    | HelpSelfCovidTitle
    | HelpSelfCovidResource1Title
    | HelpSelfCovidResource1Summary
    | HelpSelfCovidResource1Quote1
    | HelpSelfCovidResource1Link
    | HelpSelfCovidResource2Title
    | HelpSelfCovidResource2Summary
    | HelpSelfCovidResource2Link
      -- Help Self single InfoLaw
    | HelpSelfInfoLawTitle
    | HelpSelfInfoLawResource1Title
    | HelpSelfInfoLawResource1Summary
    | HelpSelfInfoLawResource1Link
    | HelpSelfInfoLawResource1Quote1
    | HelpSelfInfoLawResource2Title
    | HelpSelfInfoLawResource2Summary
    | HelpSelfInfoLawResource2Link
      -- Help Self single Separating
    | HelpSelfSeparatingTitle
    | HelpSelfSeparatingResource1Title
    | HelpSelfSeparatingResource1Quote1
    | HelpSelfSeparatingResource1Summary
    | HelpSelfSeparatingResource1Link
    | HelpSelfSeparatingResource2Title
    | HelpSelfSeparatingResource2Quote1
    | HelpSelfSeparatingResource2Quote2
    | HelpSelfSeparatingResource2Summary
    | HelpSelfSeparatingResource2Link
      -- Get Help page
    | GetHelpTitle
    | GetHelpSection1Title
    | GetHelpSection1Quote
    | GetHelpSection1Description
    | GetHelpSection1CallToAction
    | GetHelpSection2Title
    | GetHelpSection2Quote
    | GetHelpSection2Description
    | GetHelpSection2CallToAction1
    | GetHelpSection2CallToAction2
    | GetHelpSection3Title
    | GetHelpSection3Quote
    | GetHelpSection3Description
    | GetHelpSection3CallToAction
    | ToHelpSelfReassuringText
    | ToHelpSelfFromGetHelpLink
