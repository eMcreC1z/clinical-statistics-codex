$ErrorActionPreference = "Stop"

$sourceUrl = "https://jamanetwork.com/channels/trials/pages/guide-to-statistics-and-methods-for-trials"
$generatedOn = "2026-05-12"

$headers = @(
  "阶段",
  "模块",
  "主题/文章",
  "发表时间",
  "实战问题",
  "适用场景",
  "关键方法",
  "实操步骤",
  "常见坑",
  "建议工具/模型",
  "练习任务",
  "掌握标准",
  "来源"
)

$rows = @(
  [pscustomobject]@{
    阶段="P2 进阶设计"; 模块="试验类型与设计"; "主题/文章"="The Stepped-Wedge Clinical Trial: Evaluation by Rolling Deployment"; 发表时间="2018-02-13";
    实战问题="干预必须分批上线时，如何估计干预效果？"; 适用场景="医院、学校、社区等集群无法同时实施干预，且上线顺序可随机。";
    关键方法="阶梯楔形设计；集群随机；时间效应调整；混合效应模型。"; 实操步骤="画出集群-时间矩阵；随机上线顺序；预设时间固定效应和集群随机效应；报告ICC和敏感性分析。";
    常见坑="把时间趋势当成治疗效应；忽略集群相关；上线期污染未记录。"; "建议工具/模型"="R: lme4/glmmTMB/geepack；模型: GLMM或GEE。";
    练习任务="用模拟数据生成10个集群6个时期，比较未调时间与调时间模型的估计差异。"; 掌握标准="能解释为什么必须调整日历时间，并能给出样本量受ICC影响的方向。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶设计"; 模块="试验类型与设计"; "主题/文章"="Factorial Clinical Trial Designs"; 发表时间="2025-01-15";
    实战问题="能否在一个试验中同时评估多个干预组件？"; 适用场景="两个或多个干预相对独立，研究者关心主效应及可能交互。";
    关键方法="2x2或多因素设计；主效应；交互作用；边际均值。"; 实操步骤="列出所有组合臂；预设是否检验交互；按主效应或交互目标计算样本量；用回归模型包含因子项。";
    常见坑="交互检验功效不足；发现交互后仍只解释主效应；依从性差导致组合臂解释困难。"; "建议工具/模型"="R: lm/glm/emmeans；模型: 含交互项的线性或广义线性模型。";
    练习任务="构造2x2生活方式干预数据，估计两个主效应和交互项，并画边际均值图。"; 掌握标准="能区分主效应问题和交互问题，并说明样本量为何通常按最难检测的目标设计。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P3 专题深化"; 模块="试验类型与设计"; "主题/文章"="Platform Clinical Trials for the Efficient Evaluation of Multiple Treatments"; 发表时间="2025-02-17";
    实战问题="如何在同一试验基础设施中连续比较多个治疗？"; 适用场景="疾病领域治疗快速迭代，多个候选治疗需共享对照、允许臂进入或退出。";
    关键方法="平台试验；共享对照；响应适应性随机；贝叶斯或频率学监测。"; 实操步骤="定义平台主方案和域方案；设置进入/退出规则；控制同时比较错误率；建立数据监测节奏。";
    常见坑="不同时间进入的治疗与对照不可比；操作复杂度低估；多重性控制不清。"; "建议工具/模型"="R: rpact/brms/rstanarm；专用模拟框架。";
    练习任务="设计一个三治疗臂平台方案，写出共享对照、疗效停臂和无效停臂规则。"; 掌握标准="能说明平台试验与传统多臂试验的区别，并能识别非同时对照的偏倚风险。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶设计"; 模块="试验类型与设计"; "主题/文章"="What Is a Stepped-Wedge Cluster Randomized Trial?"; 发表时间="2025-03-10";
    实战问题="何时应把阶梯楔形设计做成集群随机？"; 适用场景="干预作用于群体层面，或个体随机会产生明显污染。";
    关键方法="集群随机；交叉到干预；时期固定效应；集群内相关。"; 实操步骤="确认干预单位是集群；设定每期测量窗口；记录暴露滞后期；分析时同时建模集群和时期。";
    常见坑="把个体数当独立样本量；未处理实施过渡期；混淆开放队列和闭合队列。"; "建议工具/模型"="R: lme4/geepack/clubSandwich。";
    练习任务="比较平行集群RCT与阶梯楔形RCT在同一ICC下的有效样本量。"; 掌握标准="能画出设计图，并清楚说明集群、时期、个体三层结构。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="试验类型与设计"; "主题/文章"="Cluster Randomized Trials: Evaluating Treatments Applied to Groups"; 发表时间="2015-05-26";
    实战问题="治疗作用于群体时，如何避免把相关数据当独立数据？"; 适用场景="医院政策、医生培训、学校健康项目、社区干预。";
    关键方法="集群随机；ICC；设计效应；分层或匹配集群。"; 实操步骤="确定随机单位；估计ICC；按设计效应膨胀样本量；分析时用集群稳健SE、GEE或混合模型。";
    常见坑="只按个体随机试验算样本量；集群数量过少仍用大样本近似；基线不平衡未预设调整。"; "建议工具/模型"="R: geepack/lme4/sandwich；Stata: xtgee/mixed。";
    练习任务="用不同ICC计算设计效应，观察所需样本量如何变化。"; 掌握标准="能解释ICC、设计效应，并能选择集群层面或个体层面分析。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="试验类型与设计"; "主题/文章"="Noninferiority Trials: Is a New Treatment Almost as Effective as Another?"; 发表时间="2015-06-16";
    实战问题="新治疗稍弱但更安全或更方便，如何证明不劣？"; 适用场景="已有有效治疗，新方案有便利性、安全性、成本或可及性优势。";
    关键方法="非劣效界值；单侧检验；置信区间；ITT与PP双重分析。"; 实操步骤="用临床理由定非劣界值；保留历史疗效证据；预设ITT和PP；按CI与界值比较结论。";
    常见坑="事后选择非劣界值；把无显著差异解释为非劣；依从性差反而推向非劣。"; "建议工具/模型"="R: TrialSize/PropCIs；常规模型加CI判读。";
    练习任务="给定风险差和95%CI，判断是否非劣、是否优效，并写一句临床解释。"; 掌握标准="能独立解释非劣界值的临床含义，并说明ITT与PP结论不一致时的风险。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="试验类型与设计"; "主题/文章"="Pragmatic Trials: Practical Answers to Real World Questions"; 发表时间="2016-09-20";
    实战问题="治疗在真实世界里是否有效，而不仅是理想条件下有效？"; 适用场景="医疗政策、常规护理路径、真实临床环境中的有效性问题。";
    关键方法="解释性-实用性连续谱；广泛纳入；真实世界结局；实施可行性。"; 实操步骤="明确目标人群和真实场景；减少额外访视；选择患者重要结局；记录治疗交叉和执行差异。";
    常见坑="设计过度理想化；数据质量控制不足；把执行失败和治疗无效混为一谈。"; "建议工具/模型"="PRECIS-2框架；R: tidyverse/survival。";
    练习任务="把一个严格RCT方案改写为实用性RCT，列出至少5处设计变化。"; 掌握标准="能说明外部效度与内部效度的取舍，并提出可执行的数据质量方案。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P3 专题深化"; 模块="试验类型与设计"; "主题/文章"="Sequential, Multiple Assignment, Randomized Trial Designs"; 发表时间="2023-01-24/31";
    实战问题="患者治疗需按反应动态调整时，如何比较治疗策略？"; 适用场景="慢病、心理行为干预、肿瘤序贯治疗等需要多阶段决策。";
    关键方法="SMART设计；动态治疗方案；再随机化；嵌入式策略比较。"; 实操步骤="定义每个阶段的反应标准；列出可行策略；设计再随机化点；用加权或GEE估计策略效果。";
    常见坑="只比较单个治疗而忽略策略；反应者定义事后变化；样本量未覆盖多阶段比较。"; "建议工具/模型"="R: qlaci/DTRreg/geepack。";
    练习任务="设计一个两阶段SMART：初治、反应评估、强化或转换治疗，并画策略树。"; 掌握标准="能把临床路径转成动态治疗策略，并解释再随机化的目的。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶设计"; 模块="试验类型与设计"; "主题/文章"="The Use of Historical Controls in Clinical Trials"; 发表时间="2023-09-28";
    实战问题="能否用历史对照减少或替代同期对照？"; 适用场景="罕见病、伦理限制、外部数据质量高且可比性强的场景。";
    关键方法="历史对照；外部对照；倾向评分；贝叶斯借力；敏感性分析。"; 实操步骤="评估可比性；统一入排标准和结局定义；建模混杂；预设借力强度；做偏倚敏感性分析。";
    常见坑="历史治疗环境已变；结局测量不一致；只调可见混杂，忽略不可测混杂。"; "建议工具/模型"="R: MatchIt/WeightIt/brms；目标试验模拟。";
    练习任务="用真实世界历史队列构造外部对照，比较未调整、匹配、加权后的效果估计。"; 掌握标准="能列出使用历史对照的必要条件，并能解释为什么同期随机对照仍是基准。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="干预分配与随机化"; "主题/文章"="Equipoise in Research: Integrating Ethics and Science in Human Research"; 发表时间="2017-02-07";
    实战问题="什么时候随机分配在伦理上成立？"; 适用场景="比较治疗优劣尚无确定答案，且患者风险收益可接受。";
    关键方法="临床均势；知情同意；风险收益评估；伦理审查。"; 实操步骤="梳理现有证据；说明不确定性；明确保护措施；在方案中写清退出和救援治疗。";
    常见坑="研究者个人偏好替代群体证据；对照组护理低于标准；知情同意过度技术化。"; "建议工具/模型"="伦理审查清单；CONSORT/SPIRIT。";
    练习任务="为一个RCT写一段均势说明，包含现有证据、不确定性和参与者保护。"; 掌握标准="能用普通语言解释为什么随机化不是把患者置于不公。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶设计"; 模块="干预分配与随机化"; "主题/文章"="Covariate-Constrained Randomization"; 发表时间="2025-06-30";
    实战问题="集群数少时，如何让关键协变量在组间更平衡？"; 适用场景="集群RCT、小样本随机化、基线特征强烈影响结局。";
    关键方法="协变量约束随机化；平衡指标；随机化空间限制；有效推断。"; 实操步骤="选定少量关键协变量；生成大量随机分配；保留平衡较好的方案；从合格集合中随机抽取。";
    常见坑="用太多协变量过度约束；未保存随机化集合；分析阶段忽略设计。"; "建议工具/模型"="R: cvcrand/CRTpower。";
    练习任务="模拟20个集群，比较完全随机与协变量约束随机的基线差异分布。"; 掌握标准="能说明约束随机化仍需随机抽取，并能报告约束规则。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="干预分配与随机化"; "主题/文章"="Randomization in Clinical Trials: Permuted Blocks and Stratification"; 发表时间="2018-06-05";
    实战问题="如何在入组过程中保持组间人数和关键因素平衡？"; 适用场景="小样本、多中心、关键预后因素需要平衡的RCT。";
    关键方法="置换区组；随机区组大小；分层随机；分配隐藏。"; 实操步骤="确定分层变量；设置随机区组大小；由独立系统生成序列；分析模型纳入分层因素。";
    常见坑="固定区组大小导致可预测；分层变量过多造成空层；分配隐藏不严。"; "建议工具/模型"="R: blockrand/randomizeR；REDCap随机化模块。";
    练习任务="生成按中心和疾病严重度分层的随机表，检查每层平衡。"; 掌握标准="能区分随机序列生成、分配隐藏和盲法三件事。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶设计"; 模块="干预分配与随机化"; "主题/文章"="Use of Run-in Periods in Randomized Trials"; 发表时间="2020-07-14";
    实战问题="随机前筛掉不依从或不能耐受者，会带来什么影响？"; 适用场景="需确认依从性、稳定基线、洗脱既往治疗或安全性筛查。";
    关键方法="run-in期；富集设计；外部效度；选择偏倚。"; 实操步骤="说明run-in目的；记录排除人数和原因；将适用人群写入estimand；报告对推广性的限制。";
    常见坑="美化疗效和安全性；不报告run-in淘汰；把结果推广到所有患者。"; "建议工具/模型"="CONSORT流程图；描述性统计。";
    练习任务="用流程图量化run-in前后样本人群变化，并讨论外部效度。"; 掌握标准="能判断run-in是提高内部效度还是牺牲外部效度，并写出报告要点。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局定义与测量"; "主题/文章"="When Can Intermediate Outcomes Be Used as Surrogate Outcomes?"; 发表时间="2020-02-27";
    实战问题="中间指标什么时候能替代真正临床结局？"; 适用场景="最终结局罕见或需长期随访，存在候选生物标志物或中间终点。";
    关键方法="替代终点验证；个体层面关联；试验层面关联；临床相关性。"; 实操步骤="明确患者重要结局；检查替代指标证据；评估治疗对替代和真实结局的一致性；保留不确定性表述。";
    常见坑="相关不等于可替代；只看个体相关；忽略治疗机制改变。"; "建议工具/模型"="Meta-analysis；R: metafor。";
    练习任务="评估一个生物标志物作为替代终点的证据表，区分强证据和弱证据。"; 掌握标准="能说清替代终点需要跨试验证据，而不仅是患者层面相关。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局定义与测量"; "主题/文章"="Patient-Reported Outcome Measures in Clinical Research"; 发表时间="2022-07-15";
    实战问题="如何把患者主观感受变成可信的试验结局？"; 适用场景="疼痛、生活质量、功能状态、症状负担等患者报告结局。";
    关键方法="PRO量表；信度；效度；响应性；缺失处理。"; 实操步骤="选择已验证量表；设定测量时间点；预定义评分和MCID；监控填写率；分析缺失机制。";
    常见坑="自行改量表未验证；多时间点多量表未控多重性；把统计显著误作患者有感。"; "建议工具/模型"="R: psych/lavaan/mice；PROMIS工具。";
    练习任务="为疼痛RCT选择PRO量表，写出评分、主要时间点、MCID和缺失处理。"; 掌握标准="能同时评价量表质量、患者意义和统计分析可行性。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="期中数据与安全监测"; "主题/文章"="Interpretation of Clinical Trials That Stopped Early"; 发表时间="2016-04-19";
    实战问题="提前停止的试验结果应如何谨慎解读？"; 适用场景="因疗效、安全性、无效或招募问题提前停止的RCT。";
    关键方法="提前停止；疗效高估；信息量；监测边界。"; 实操步骤="确认停止原因；查看预设规则；检查事件数和随访长度；报告效果估计的不确定性。";
    常见坑="把早停结果当最终稳定效果；未区分疗效早停和行政早停；忽略长期安全性。"; "建议工具/模型"="试验监测报告；R: survival/rpact。";
    练习任务="阅读一篇早停试验，提取停止规则、观察事件数、效应大小和潜在高估风险。"; 掌握标准="能判断早停是否按预设执行，并能解释为什么效果可能偏大。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶监测"; 模块="期中数据与安全监测"; "主题/文章"="Interim Analyses During Group Sequential Clinical Trials"; 发表时间="2021-10-01";
    实战问题="多次期中分析如何控制总体I类错误？"; 适用场景="大型RCT，需要在试验中途因疗效或安全性做正式决策。";
    关键方法="组序贯设计；O'Brien-Fleming；Pocock；alpha spending。"; 实操步骤="预设期中次数和信息量；选择alpha花费函数；制定疗效/安全/无效边界；保持盲态和独立DMC。";
    常见坑="期中分析次数临时增加；只看名义P值；DMC和研究团队信息隔离不足。"; "建议工具/模型"="R: gsDesign/rpact/ldbounds。";
    练习任务="设计一个2次期中+最终分析的组序贯方案，列出每次名义显著性界值。"; 掌握标准="能解释信息时间和alpha花费，并能读懂边界图。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶监测"; 模块="期中数据与安全监测"; "主题/文章"="Assessing Unexpected Circumstances That Lead to Modifications in Clinical Trial Design, Conduct, or Analysis: Application of the CONSERVE Reporting Guideline"; 发表时间="2022-03-01";
    实战问题="突发事件迫使方案变化时，如何透明报告？"; 适用场景="疫情、供应中断、招募失败、结局采集改变等意外情况。";
    关键方法="CONSERVE报告；方案偏离；修订记录；敏感性分析。"; 实操步骤="记录事件时间线；说明改变前后影响；更新SAP；报告主分析和敏感性分析。";
    常见坑="只在讨论中轻描淡写；未说明谁在何时决定修改；未评估偏倚方向。"; "建议工具/模型"="CONSERVE清单；SAP修订日志。";
    练习任务="为一个受疫情影响的RCT写CONSERVE式变更摘要。"; 掌握标准="能把设计、执行、分析三个层面的变化分别说明，并给出敏感性分析。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶监测"; 模块="期中数据与安全监测"; "主题/文章"="Conditional Power: How Likely Is Trial Success?"; 发表时间="2023-01-23";
    实战问题="基于当前数据，试验最终成功的概率有多大？"; 适用场景="期中阶段判断是否继续、扩样或因无望停止。";
    关键方法="条件功效；预测功效；当前趋势假设；设计效应假设。"; 实操步骤="确定当前信息量；指定未来效应假设；计算条件功效；结合临床和运营因素决策。";
    常见坑="把条件功效当真实成功概率；未来效应假设不透明；低条件功效后事后改终点。"; "建议工具/模型"="R: gsDesign/rpact；贝叶斯预测概率。";
    练习任务="在不同未来效应假设下计算条件功效，比较结论敏感性。"; 掌握标准="能解释条件功效依赖假设，并能区分conditional power与predictive probability。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶监测"; 模块="期中数据与安全监测"; "主题/文章"="Futility in Clinical Trials"; 发表时间="2023-07-31";
    实战问题="什么时候应因无效或无望而停止试验？"; 适用场景="保护受试者、节省资源、避免继续一个成功机会很低的试验。";
    关键方法="无效边界；非约束性边界；条件功效；预测概率。"; 实操步骤="预设无效规则；明确是否有约束力；评估安全性和外部证据；由DMC提出建议。";
    常见坑="把招募慢当统计无效；无效规则过早过严；停止后结论表述过强。"; "建议工具/模型"="R: rpact/gsDesign；DMC章程。";
    练习任务="为一项二分类结局RCT设置无效边界，并模拟不同真实效应下的停止概率。"; 掌握标准="能说明无效停止的伦理和统计理由，并能读懂停止概率模拟。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局分析与解释"; "主题/文章"="The Intention-to-Treat Principle: How to Assess the True Effect of Choosing a Medical Treatment"; 发表时间="2014-07-02";
    实战问题="如何估计被分配到某治疗策略的效果？"; 适用场景="随机试验主分析，存在不依从、交叉、停药或方案偏离。";
    关键方法="意向治疗；随机化保护；治疗策略estimand；完整随访。"; 实操步骤="按随机分组分析；尽量收集所有结局；预设缺失处理；把PP/AT作为补充。";
    常见坑="排除不依从者破坏随机化；把ITT解释为实际服药效果；失访过多仍声称无偏。"; "建议工具/模型"="R: glm/survival/mice；CONSORT。";
    练习任务="同一数据分别做ITT、PP、AT分析，比较估计差异并解释原因。"; 掌握标准="能说清ITT回答的是分配策略效果，而不是纯生物疗效。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局分析与解释"; "主题/文章"="Multiple Comparison Procedures"; 发表时间="2014-08-06";
    实战问题="多个终点或亚组同时检验时，如何控制假阳性？"; 适用场景="多个主要/次要终点、多剂量、多亚组、多时间点。";
    关键方法="FWER；FDR；Bonferroni；Holm；层级检验。"; 实操步骤="列出检验家族；确定控制目标；预设调整方法；报告调整后P值或置信区间。";
    常见坑="只挑显著结果报告；把探索性分析包装成验证性；未定义检验家族。"; "建议工具/模型"="R: p.adjust/multcomp。";
    练习任务="对10个终点P值做Bonferroni、Holm和BH调整，比较哪些结论改变。"; 掌握标准="能判断何时控制FWER、何时可用FDR，并能写出多重性策略。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局分析与解释"; "主题/文章"="Minimal Clinically Important Difference: Defining What Really Matters to Patients"; 发表时间="2014-10-01";
    实战问题="统计显著的差异是否真的对患者有意义？"; 适用场景="连续量表、PRO、功能评分、生活质量和风险差解释。";
    关键方法="MCID；anchor-based；distribution-based；临床阈值。"; 实操步骤="在方案中预设MCID；结合患者或临床锚点；报告效应大小与CI相对MCID的位置。";
    常见坑="样本大导致微小差异显著；事后改MCID；不同人群沿用同一阈值。"; "建议工具/模型"="R: effectsize/emmeans；量表验证文献。";
    练习任务="给定均值差和CI，判断是否达到MCID，并写出患者层面解释。"; 掌握标准="能把P值、CI和MCID放在同一句结果解释中。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶分析"; 模块="结局分析与解释"; "主题/文章"="Bayesian Analysis: Using Prior Information to Interpret the Results of Clinical Trials"; 发表时间="2017-10-24/31";
    实战问题="如何把既往证据和当前试验数据合并判断？"; 适用场景="小样本、罕见病、适应性设计、需要概率化决策。";
    关键方法="先验；后验；可信区间；后验概率；敏感性分析。"; 实操步骤="定义弱信息和信息先验；拟合模型；报告后验概率和区间；做先验敏感性分析。";
    常见坑="先验选择不透明；把可信区间解释成频率CI；忽略先验与数据冲突。"; "建议工具/模型"="R: brms/rstanarm/rjags；Stan。";
    练习任务="用同一数据分别设弱先验和乐观先验，比较后验治疗效果。"; 掌握标准="能解释先验、似然、后验的关系，并能报告先验敏感性。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶分析"; 模块="结局分析与解释"; "主题/文章"="Treatment Effects in Multicenter Randomized Clinical Trials"; 发表时间="2019-03-01";
    实战问题="多中心试验中，中心差异如何进入分析？"; 适用场景="多个医院或国家参与，中心规模和基线风险差异明显。";
    关键方法="中心固定效应；中心随机效应；中心-治疗交互；分层因素调整。"; 实操步骤="确认随机是否按中心分层；主模型纳入中心或区域；检查小中心合并策略；探索异质性。";
    常见坑="中心太多且小样本导致模型不稳；忽略中心与治疗交互；事后选择中心合并。"; "建议工具/模型"="R: lme4/survival/coxme。";
    练习任务="模拟20中心RCT，比较不调中心、固定效应、随机效应模型。"; 掌握标准="能说明中心效应调整的目的，并理解异质性探索不是随意亚组。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶分析"; 模块="结局分析与解释"; "主题/文章"="Adjusting for Nonadherence or Stopping Treatments in Randomized Clinical Trials"; 发表时间="2021-05-25";
    实战问题="不依从或停药后，如何估计实际治疗相关效果？"; 适用场景="治疗交叉、停药、救援治疗、依从性差。";
    关键方法="CACE；IV；IPCW；g-methods；敏感性分析。"; 实操步骤="保留ITT主分析；定义补充estimand；记录依从和停药原因；选择因果方法并报告假设。";
    常见坑="简单排除停药者；忽略停药受预后影响；把补充分析当随机化主证据。"; "建议工具/模型"="R: ivreg/ipw/survival；target trial框架。";
    练习任务="用含停药数据比较ITT、PP、IPCW三种估计，并写出各自假设。"; 掌握标准="能解释为什么依从性调整通常需要更强假设。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局分析与解释"; "主题/文章"="Interpreting the Results of Intention-to-Treat, Per-Protocol, and As-Treated Analyses of Clinical Trials"; 发表时间="2021-08-03";
    实战问题="ITT、PP、AT结果不一致时，该怎么解释？"; 适用场景="主要分析后做依从性、实际治疗或方案符合者补充分析。";
    关键方法="ITT；per-protocol；as-treated；选择偏倚；因果解释。"; 实操步骤="先报告ITT；明确PP排除规则；AT按实际治疗重分组；比较差异并讨论偏倚方向。";
    常见坑="把AT当随机比较；PP规则事后设定；只报告最有利结果。"; "建议工具/模型"="R: glm/survival；CONSORT偏离表。";
    练习任务="制作一张三种分析人群定义表，并用同一结局输出三列结果。"; 掌握标准="能用一段话说明三种分析分别回答什么问题。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P3 专题深化"; 模块="结局分析与解释"; "主题/文章"="Using Effect Scores to Characterize Heterogeneity of Treatment Effects"; 发表时间="2024-03-19";
    实战问题="如何描述个体层面治疗效果差异，而不是只看平均效果？"; 适用场景="需要个体化治疗决策、风险分层、预测获益人群。";
    关键方法="效应评分；风险模型；校准；决策曲线；异质性治疗效果。"; 实操步骤="建立基线风险或效应模型；避免用治疗后变量；内部验证；按效应分层报告绝对获益。";
    常见坑="把亚组P值当个体化证据；模型过拟合；只报告相对效应不报绝对效应。"; "建议工具/模型"="R: tidymodels/rms/grf；causal forest。";
    练习任务="建立一个基线风险模型，按预测风险四分位报告治疗绝对风险差。"; 掌握标准="能区分预后异质性和治疗效应异质性，并能评价模型校准。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶分析"; 模块="结局分析与解释"; "主题/文章"="Tipping Point Analysis: Assessing the Potential Impact of Missing Data"; 发表时间="2025-06-16";
    实战问题="缺失数据要严重到什么程度才会推翻结论？"; 适用场景="主要结局缺失较多，需评估MNAR情景下结论稳健性。";
    关键方法="tipping point；情景分析；MNAR；敏感性分析。"; 实操步骤="完成主缺失处理；设定不同组别缺失者结局假设；网格搜索结论改变点；报告临床可信度。";
    常见坑="只做MAR插补；情景范围过窄；找到翻转点后不讨论是否现实。"; "建议工具/模型"="R: mice/tipmiss；自写网格模拟。";
    练习任务="对二分类结局缺失者设不同事件率，找出P值或CI跨越阈值的组合。"; 掌握标准="能把统计翻转点转化为临床上是否可信的判断。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P3 专题深化"; 模块="结局分析与解释"; "主题/文章"="Pattern-Mixture Models for Missing Data"; 发表时间="2025-10-30";
    实战问题="缺失机制可能不同于观察者时，如何建模？"; 适用场景="结局缺失与预后或治疗反应相关，MAR假设可疑。";
    关键方法="pattern-mixture模型；delta adjustment；MNAR敏感性。"; 实操步骤="按缺失模式分层；建立观察数据模型；对未观察结局加入delta偏移；展示多情景结果。";
    常见坑="把MNAR模型当可验证真相；delta选择无临床依据；缺失模式过细导致不稳定。"; "建议工具/模型"="R: mice/JointAI；贝叶斯模型。";
    练习任务="对连续结局做delta-adjusted pattern-mixture敏感性分析，画delta与估计值关系。"; 掌握标准="能说明MNAR分析主要是稳健性评估，而不是证明缺失机制。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P3 专题深化"; 模块="结局分析与解释"; "主题/文章"="Dose-Finding Trials: Optimizing Phase 2 Data in the Drug Development Process"; 发表时间="2015-12-01";
    实战问题="如何选择进入后期试验的合适剂量？"; 适用场景="药物开发2期，需在疗效、毒性和剂量反应间权衡。";
    关键方法="剂量反应；MCP-Mod；贝叶斯剂量寻找；安全性监测。"; 实操步骤="定义候选剂量；建模剂量-疗效和剂量-毒性；设定最小有效剂量或推荐剂量；模拟操作特性。";
    常见坑="只比较每个剂量与安慰剂；样本量不足识别曲线；忽略安全性和给药便利性。"; "建议工具/模型"="R: DoseFinding/dfpk/brms。";
    练习任务="用5个剂量组模拟剂量反应，拟合Emax模型并选择推荐剂量。"; 掌握标准="能说明为什么剂量选择不是简单挑P值最小组。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局分析与解释"; "主题/文章"="Estimands, Estimators, and Estimates"; 发表时间="2021-08-23";
    实战问题="研究问题、统计方法和结果数值如何对齐？"; 适用场景="任何临床试验方案、SAP和结果解释。";
    关键方法="estimand；estimator；estimate；intercurrent events；ICH E9(R1)。"; 实操步骤="定义人群、处理、结局、汇总指标和干扰事件策略；再选择估计量；最后报告估计值。";
    常见坑="先套模型再倒推问题；不说明停药、救援治疗、死亡等事件策略；结果解释与目标不一致。"; "建议工具/模型"="ICH E9(R1)框架；SAP模板。";
    练习任务="为一个糖尿病RCT写5要素estimand，并说明停药后的结局如何处理。"; 掌握标准="能在读论文时指出作者的estimand是什么，若未说明能发现缺口。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局分析与解释"; "主题/文章"="Missing Data: How to Best Account for What Is Not Known"; 发表时间="2015-09-01";
    实战问题="结局缺失时，怎样减少偏倚并诚实表达不确定性？"; 适用场景="失访、未完成量表、死亡前后结局、电子病历缺漏。";
    关键方法="MCAR/MAR/MNAR；完整案例；权重；插补；敏感性分析。"; 实操步骤="预防缺失；描述缺失模式；主分析使用合理假设；做MNAR敏感性分析；报告缺失比例和原因。";
    常见坑="默认完整案例无偏；只报插补后结果；把缺失原因混成一类。"; "建议工具/模型"="R: mice/naniar/VIM/ipw。";
    练习任务="画缺失模式图，比较完整案例和多重插补的治疗效果估计。"; 掌握标准="能根据缺失机制选择方法，并明确哪些假设不可由数据证明。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局分析与解释"; "主题/文章"="Multiple Imputation: A Flexible Tool for Handling Missing Data"; 发表时间="2015-11-10";
    实战问题="如何用多重插补处理不完整协变量或结局？"; 适用场景="缺失可由已观测变量解释，MAR假设较可接受。";
    关键方法="多重插补；Rubin规则；插补模型兼容；预测均值匹配。"; 实操步骤="纳入与缺失和结局相关变量；生成足够插补数据集；分别分析；用Rubin规则合并；检查诊断。";
    常见坑="插补模型少于分析模型；只插补一次；先删变量再插补；忽略分组或纵向结构。"; "建议工具/模型"="R: mice/Amelia/mitools。";
    练习任务="用mice做20次插补，输出合并OR和95%CI，并检查插补值分布。"; 掌握标准="能说明插补模型应比分析模型更丰富，并会报告插补次数和变量。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶分析"; 模块="结局分析与解释"; "主题/文章"="Gatekeeping Strategies for Avoiding False-Positive Results in Clinical Trials With Many Comparisons"; 发表时间="2017-10-10";
    实战问题="多个终点有优先级时，如何有序控制假阳性？"; 适用场景="主要终点、关键次要终点、多剂量或多层级假设。";
    关键方法="gatekeeping；层级检验；alpha传递；闭合检验。"; 实操步骤="按临床优先级排序假设；定义进入下一层条件；预设alpha分配与传递；严格按顺序报告。";
    常见坑="看到结果后调整顺序；跳过失败假设继续宣称验证性成功；层级与临床重要性不符。"; "建议工具/模型"="R: gMCP/multxpert。";
    练习任务="为3个终点设计fixed-sequence和fallback两种gatekeeping方案。"; 掌握标准="能画出假设图，并说明某一节点失败后后续结论如何降级。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P3 专题深化"; 模块="结局分析与解释"; "主题/文章"="Bayesian Hierarchical Models"; 发表时间="2018-12-11";
    实战问题="多个中心、亚组或结局间如何部分借力？"; 适用场景="小样本亚组、多中心差异、稀有事件、多层结构数据。";
    关键方法="层级模型；部分汇聚；随机效应；后验收缩。"; 实操步骤="识别层级结构；设定合理先验；检查收缩效果；报告总体和层级特异估计。";
    常见坑="把收缩后的亚组结果当确定发现；先验过强；模型诊断不足。"; "建议工具/模型"="R: brms/rstanarm/Stan。";
    练习任务="用多中心二分类数据拟合层级logistic模型，比较每中心粗率与收缩估计。"; 掌握标准="能解释部分汇聚为什么可减少极端小样本估计。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局分析与解释"; "主题/文章"="Number Needed to Treat: Conveying the Likelihood of a Therapeutic Effect"; 发表时间="2019-02-07";
    实战问题="如何把绝对获益转成临床容易理解的数字？"; 适用场景="二分类结局、事件风险降低、患者沟通和指南解释。";
    关键方法="绝对风险差；NNT；NNH；时间范围。"; 实操步骤="计算对照风险和治疗风险；求绝对风险差；取倒数得到NNT；报告时间窗和CI。";
    常见坑="用相对风险直接算NNT；忽略基线风险；不说明随访时间；NNT跨无效时解释错误。"; "建议工具/模型"="R: epitools/PropCIs；手算风险差。";
    练习任务="用三种不同基线风险计算同一相对风险下的NNT，比较临床含义。"; 掌握标准="能解释NNT随基线风险变化，并同时报告获益和伤害。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶分析"; 模块="结局分析与解释"; "主题/文章"="Heterogeneity of Treatment Effect: Estimating How the Effects of Interventions Vary Across Individuals"; 发表时间="2021-12-14";
    实战问题="平均治疗效果背后是否存在重要差异？"; 适用场景="亚组分析、个体化治疗、基线风险差异大的试验。";
    关键方法="交互项；绝对风险差；预设亚组；异质性治疗效果。"; 实操步骤="预设少量可信亚组；模型中检验交互；优先报告绝对效应；避免按结果挖掘亚组。";
    常见坑="组内显著、组间不显著的误读；亚组过多；只看相对效应忽略绝对获益。"; "建议工具/模型"="R: glm/emmeans/forestplot。";
    练习任务="做一个亚组森林图，标注交互P值和每组绝对风险差。"; 掌握标准="能指出亚组分析主要看交互，而不是各亚组内P值。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P1 基础必会"; 模块="结局分析与解释"; "主题/文章"="Adjustment for Baseline Characteristics in Randomized Clinical Trials"; 发表时间="2022-11-17";
    实战问题="随机试验还需要调整基线变量吗？"; 适用场景="连续或二分类结局，基线强预后变量已知，需提高精度或处理偶然不平衡。";
    关键方法="协变量调整；ANCOVA；预设调整变量；精度提升。"; 实操步骤="在SAP预设少量强预后变量；使用合适回归模型；报告调整和未调整敏感性结果。";
    常见坑="因为基线P值显著才调整；纳入治疗后变量；变量太多导致模型不稳。"; "建议工具/模型"="R: lm/glm/survival/emmeans。";
    练习任务="比较变化值分析、ANCOVA和未调整分析在同一连续结局上的估计精度。"; 掌握标准="能解释随机化保证无偏，协变量调整主要提高精度且应预设。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶分析"; 模块="结局分析与解释"; "主题/文章"="Why Test for Proportional Hazards?"; 发表时间="2020-03-13";
    实战问题="Cox模型的风险比在时间变化时还好解释吗？"; 适用场景="生存结局、治疗效果可能随时间减弱或延迟出现。";
    关键方法="比例风险假设；Schoenfeld残差；RMST；时间变化效应。"; 实操步骤="画log-minus-log或Schoenfeld诊断；检验PH假设；若违反，报告RMST或分段HR。";
    常见坑="PH明显违反仍只报单一HR；把HR当风险比；忽略随访时间分布。"; "建议工具/模型"="R: survival/survminer/rmst2。";
    练习任务="模拟延迟治疗效果，比较Cox HR和RMST差异。"; 掌握标准="能说明HR不是绝对风险差，并能在PH不成立时选择替代指标。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶因果"; 模块="结局分析与解释"; "主题/文章"="Collider Bias"; 发表时间="2022-03-14";
    实战问题="为什么调整某些变量反而会制造偏倚？"; 适用场景="选择入组、只分析幸存者、按治疗后变量分层或调整。";
    关键方法="碰撞偏倚；DAG；选择偏倚；治疗后变量。"; 实操步骤="画DAG；标记暴露、结局、混杂、碰撞点；避免调整共同结果或选择变量；做敏感性讨论。";
    常见坑="见变量就调整；按治疗后反应者做亚组；只分析完成随访者。"; "建议工具/模型"="DAGitty；R: dagitty/ggdag。";
    练习任务="画一个只有住院患者样本导致暴露-结局产生虚假关联的DAG。"; 掌握标准="能用DAG解释为什么更多调整不一定更好。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P3 专题深化"; 模块="结局分析与解释"; "主题/文章"="Win Ratio Method for Hierarchical Composite Outcomes in Randomized Clinical Trials"; 发表时间="2026-01-28";
    实战问题="复合结局有重要性层级时，如何比较治疗？"; 适用场景="心血管、重症、死亡优先于住院或症状等层级复合终点。";
    关键方法="win ratio；层级复合结局；配对比较；优先级排序。"; 实操步骤="预先定义结局层级；确定比较规则和时间窗；计算胜/负/平；报告win ratio和CI。";
    常见坑="层级事后设定；低重要性结局驱动结果；忽略删失和配对策略。"; "建议工具/模型"="R: WINS/BuyseTest；生存扩展方法。";
    练习任务="用死亡、住院、症状改善构造层级结局，计算win ratio并解释。"; 掌握标准="能说明win ratio与传统复合终点的区别，以及临床优先级如何影响结论。"; 来源=$sourceUrl
  },
  [pscustomobject]@{
    阶段="P2 进阶分析"; 模块="结局分析与解释"; "主题/文章"="The Hochberg Procedure for the Comparison of Multiple End Points"; 发表时间="2026-03-05";
    实战问题="多个终点比较时，如何比Bonferroni更有功效地控错？"; 适用场景="多个主要或关键次要终点，且可接受Hochberg前提。";
    关键方法="Hochberg步骤升阶法；FWER控制；P值排序。"; 实操步骤="将P值从大到小或小到大排序；按Hochberg规则比较阈值；预设适用家族。";
    常见坑="与Holm程序混淆；依赖结构不满足仍机械使用；事后选调整方法。"; "建议工具/模型"="R: p.adjust(method='hochberg')。";
    练习任务="对5个终点P值分别做Bonferroni、Holm、Hochberg调整并比较功效。"; 掌握标准="能手工走一遍Hochberg判定流程，并说明它控制的错误率。"; 来源=$sourceUrl
  }
)

function ConvertTo-CsvLine {
  param([object[]]$Values)
  ($Values | ForEach-Object {
    $s = [string]$_
    '"' + $s.Replace('"','""') + '"'
  }) -join ","
}

function Escape-Html {
  param([string]$Text)
  if ($null -eq $Text) { return "" }
  return [System.Net.WebUtility]::HtmlEncode($Text)
}

function Escape-Xml {
  param([string]$Text)
  if ($null -eq $Text) { return "" }
  return [System.Security.SecurityElement]::Escape($Text)
}

function Get-ExcelColumnName {
  param([int]$Index)
  $name = ""
  while ($Index -gt 0) {
    $Index--
    $name = [char](65 + ($Index % 26)) + $name
    $Index = [math]::Floor($Index / 26)
  }
  return $name
}

$csvPath = Join-Path $PSScriptRoot "JAMA临床试验统计方法实战表.csv"
$htmlPath = Join-Path $PSScriptRoot "JAMA临床试验统计方法实战表.html"
$xlsxPath = Join-Path $PSScriptRoot "JAMA临床试验统计方法实战表.xlsx"

$csvLines = New-Object System.Collections.Generic.List[string]
$csvLines.Add((ConvertTo-CsvLine $headers))
foreach ($row in $rows) {
  $csvLines.Add((ConvertTo-CsvLine ($headers | ForEach-Object { $row.$_ })))
}
[System.IO.File]::WriteAllLines($csvPath, $csvLines, [System.Text.UTF8Encoding]::new($true))

$style = @"
body{font-family:Segoe UI,Microsoft YaHei,Arial,sans-serif;margin:28px;color:#1f2937;background:#f8fafc}
h1{font-size:24px;margin:0 0 8px}
.meta{font-size:13px;color:#475569;margin-bottom:18px}
table{border-collapse:collapse;width:100%;background:white;font-size:13px;line-height:1.45}
th,td{border:1px solid #cbd5e1;padding:8px 10px;vertical-align:top}
th{background:#0f766e;color:white;position:sticky;top:0;z-index:1}
tr:nth-child(even){background:#f1f5f9}
td:nth-child(1),td:nth-child(2),td:nth-child(4){white-space:nowrap}
a{color:#0f766e}
"@
$htmlRows = foreach ($row in $rows) {
  $cells = foreach ($h in $headers) {
    $value = [string]$row.$h
    if ($h -eq "来源") {
      "<td><a href=`"$(Escape-Html $value)`">JAMA专题页</a></td>"
    } else {
      "<td>$(Escape-Html $value)</td>"
    }
  }
  "<tr>$($cells -join '')</tr>"
}
$htmlHeader = ($headers | ForEach-Object { "<th>$(Escape-Html $_)</th>" }) -join ""
$html = @"
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>JAMA临床试验统计方法实战表</title>
  <style>$style</style>
</head>
<body>
  <h1>JAMA临床试验统计方法实战表</h1>
  <div class="meta">整理日期：$generatedOn；来源：<a href="$sourceUrl">$sourceUrl</a>。本表为学习实战整理，非原文转载。</div>
  <table>
    <thead><tr>$htmlHeader</tr></thead>
    <tbody>
      $($htmlRows -join "`n")
    </tbody>
  </table>
</body>
</html>
"@
[System.IO.File]::WriteAllText($htmlPath, $html, [System.Text.UTF8Encoding]::new($false))

$tempRoot = Join-Path $PSScriptRoot "_xlsx_temp"
if (Test-Path $tempRoot) {
  $resolved = (Resolve-Path $tempRoot).Path
  if (-not $resolved.StartsWith((Resolve-Path $PSScriptRoot).Path)) {
    throw "Refusing to remove temp path outside workspace: $resolved"
  }
  Remove-Item -LiteralPath $tempRoot -Recurse -Force
}
New-Item -ItemType Directory -Path (Join-Path $tempRoot "_rels") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $tempRoot "xl\_rels") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $tempRoot "xl\worksheets") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $tempRoot "docProps") -Force | Out-Null

$sheetRows = New-Object System.Collections.Generic.List[string]
$rowIndex = 1
$headerCells = for ($i = 0; $i -lt $headers.Count; $i++) {
  $ref = "$(Get-ExcelColumnName ($i + 1))$rowIndex"
  "<c r=`"$ref`" t=`"inlineStr`" s=`"1`"><is><t>$(Escape-Xml $headers[$i])</t></is></c>"
}
$sheetRows.Add("<row r=`"$rowIndex`">$($headerCells -join '')</row>")

foreach ($row in $rows) {
  $rowIndex++
  $cells = for ($i = 0; $i -lt $headers.Count; $i++) {
    $ref = "$(Get-ExcelColumnName ($i + 1))$rowIndex"
    $value = [string]$row.($headers[$i])
    "<c r=`"$ref`" t=`"inlineStr`" s=`"2`"><is><t xml:space=`"preserve`">$(Escape-Xml $value)</t></is></c>"
  }
  $sheetRows.Add("<row r=`"$rowIndex`">$($cells -join '')</row>")
}

$lastCol = Get-ExcelColumnName $headers.Count
$filterRef = "A1:$lastCol$rowIndex"
$worksheet = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">
  <sheetViews><sheetView workbookViewId="0"><pane ySplit="1" topLeftCell="A2" activePane="bottomLeft" state="frozen"/></sheetView></sheetViews>
  <cols>
    <col min="1" max="1" width="14" customWidth="1"/>
    <col min="2" max="2" width="18" customWidth="1"/>
    <col min="3" max="3" width="50" customWidth="1"/>
    <col min="4" max="4" width="15" customWidth="1"/>
    <col min="5" max="12" width="38" customWidth="1"/>
    <col min="13" max="13" width="34" customWidth="1"/>
  </cols>
  <sheetData>
    $($sheetRows -join "`n")
  </sheetData>
  <autoFilter ref="$filterRef"/>
</worksheet>
"@

$contentTypes = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>
  <Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>
  <Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>
  <Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/>
  <Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/>
</Types>
'@
$rels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/>
  <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/>
  <Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/>
</Relationships>
'@
$workbook = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">
  <sheets>
    <sheet name="实战表" sheetId="1" r:id="rId1"/>
  </sheets>
</workbook>
'@
$workbookRels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/>
  <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
</Relationships>
'@
$stylesXml = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">
  <fonts count="2">
    <font><sz val="11"/><name val="Microsoft YaHei"/></font>
    <font><b/><color rgb="FFFFFFFF"/><sz val="11"/><name val="Microsoft YaHei"/></font>
  </fonts>
  <fills count="3">
    <fill><patternFill patternType="none"/></fill>
    <fill><patternFill patternType="gray125"/></fill>
    <fill><patternFill patternType="solid"><fgColor rgb="FF0F766E"/><bgColor indexed="64"/></patternFill></fill>
  </fills>
  <borders count="2">
    <border><left/><right/><top/><bottom/><diagonal/></border>
    <border><left style="thin"><color rgb="FFD0D7DE"/></left><right style="thin"><color rgb="FFD0D7DE"/></right><top style="thin"><color rgb="FFD0D7DE"/></top><bottom style="thin"><color rgb="FFD0D7DE"/></bottom><diagonal/></border>
  </borders>
  <cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>
  <cellXfs count="3">
    <xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/>
    <xf numFmtId="0" fontId="1" fillId="2" borderId="1" xfId="0" applyFont="1" applyFill="1" applyBorder="1" applyAlignment="1"><alignment wrapText="1" vertical="top"/></xf>
    <xf numFmtId="0" fontId="0" fillId="0" borderId="1" xfId="0" applyBorder="1" applyAlignment="1"><alignment wrapText="1" vertical="top"/></xf>
  </cellXfs>
  <cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles>
</styleSheet>
'@
$core = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<cp:coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <dc:title>JAMA临床试验统计方法实战表</dc:title>
  <dc:creator>Codex</dc:creator>
  <cp:lastModifiedBy>Codex</cp:lastModifiedBy>
  <dcterms:created xsi:type="dcterms:W3CDTF">$generatedOn`T00:00:00Z</dcterms:created>
  <dcterms:modified xsi:type="dcterms:W3CDTF">$generatedOn`T00:00:00Z</dcterms:modified>
</cp:coreProperties>
"@
$app = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
  <Application>Codex</Application>
</Properties>
'@

[System.IO.File]::WriteAllText((Join-Path $tempRoot "[Content_Types].xml"), $contentTypes, [System.Text.UTF8Encoding]::new($false))
[System.IO.File]::WriteAllText((Join-Path $tempRoot "_rels\.rels"), $rels, [System.Text.UTF8Encoding]::new($false))
[System.IO.File]::WriteAllText((Join-Path $tempRoot "xl\workbook.xml"), $workbook, [System.Text.UTF8Encoding]::new($false))
[System.IO.File]::WriteAllText((Join-Path $tempRoot "xl\_rels\workbook.xml.rels"), $workbookRels, [System.Text.UTF8Encoding]::new($false))
[System.IO.File]::WriteAllText((Join-Path $tempRoot "xl\styles.xml"), $stylesXml, [System.Text.UTF8Encoding]::new($false))
[System.IO.File]::WriteAllText((Join-Path $tempRoot "xl\worksheets\sheet1.xml"), $worksheet, [System.Text.UTF8Encoding]::new($false))
[System.IO.File]::WriteAllText((Join-Path $tempRoot "docProps\core.xml"), $core, [System.Text.UTF8Encoding]::new($false))
[System.IO.File]::WriteAllText((Join-Path $tempRoot "docProps\app.xml"), $app, [System.Text.UTF8Encoding]::new($false))

if (Test-Path $xlsxPath) { Remove-Item -LiteralPath $xlsxPath -Force }
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($tempRoot, $xlsxPath)
Remove-Item -LiteralPath $tempRoot -Recurse -Force

Write-Host "Generated:"
Write-Host $xlsxPath
Write-Host $csvPath
Write-Host $htmlPath
