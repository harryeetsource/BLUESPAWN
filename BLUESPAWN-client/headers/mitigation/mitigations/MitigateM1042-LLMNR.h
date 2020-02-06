#pragma once
#include "mitigation/Mitigation.h"
#include "mitigation/MitigationRegister.h"
#include "hunt/reaction/Reaction.h"
#include "hunt/reaction/Log.h"

namespace Mitigations{

	/**
	 * MitigateM1042-LLMNR looks for LLMNR to be disabled. This helps
	 * to prevent against T1171 and is M1042 (LLMNR).
	 */
	class MitigateM1042LLMNR : public Mitigation {
	public:
		MitigateM1042LLMNR(MitigationRegister& record);

		virtual bool MitigationIsEnforced(SecurityLevel level) override;
		virtual bool EnforceMitigation(SecurityLevel level) override;
		virtual bool MitigationApplies() override;
	};
}
