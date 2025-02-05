# Better Safe Than Sorry: Enhancing Arbitration Graphs for Safe and Robust Autonomous Decision-Making

Piotr Spieker [<sup><img src="supp_material/ORCID-iD_icon.svg" height="14"/></sup>](https://orcid.org/0000-0002-0449-3741),
Nick Le Large [<sup><img src="supp_material/ORCID-iD_icon.svg" height="14"/></sup>](https://orcid.org/0009-0006-5191-9043) and
Martin Lauer [<sup><img src="supp_material/ORCID-iD_icon.svg" height="14"/></sup>](https://orcid.org/0000-0003-4414-5722)

2025 IEEE Intelligent Vehicles Symposium, June 22-25, Cluj-Napoca, Romania *(in review)*

## Abstract

This paper introduces an extension to the 
arbitration graph framework designed to enhance the safety and robustness of autonomous systems in complex, dynamic environments.

Building on the flexibility and scalability of arbitration graphs, the proposed method incorporates a verification step and structured fallback layers in the decision-making process.
This ensures that only verified and safe commands are executed while enabling graceful degradation in the presence of unexpected faults or bugs.

The approach is demonstrated using a Pac-Man simulation and further validated in the context of autonomous driving,
where it shows significant reductions in accident risk and improvements in overall system safety.
The bottom-up design of arbitration graphs allows for an incremental integration of new behavior components.
The extension presented in this work enables the integration of experimental or immature behavior components
while maintaining system safety by clearly and precisely defining the conditions under which behaviors are considered safe.

The proposed method is implemented as a ready to use header-only C++ library, published under the MIT License.
Together with the Pac-Man demo, it is available at 
[github.com/KIT-MRT/arbitration_graphs](https://github.com/KIT-MRT/arbitration_graphs).