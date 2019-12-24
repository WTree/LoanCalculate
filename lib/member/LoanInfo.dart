
class LoandInfo{
  /**
   * 每天的利息
   */
   double interestDay;

  /**
   * 每月的利息
   * 一个月按照30天计算
   */
   double interestMonth;

  /**
   * 每年的利息
   */
   double interestYear;

  /**
   * 总的利息
   */
   double interestTotal;

  /**
   * 本金
   */
   double baseMoney;

  /**
   * 是否利滚利
   */
   bool isRoll;

  /**
   * 年利率
   */
   double yearRate;

}

 class TIME{

   static const  a=2;
   static const YEAR=1;
   static const MONTH=2;
   static const DAY=3;
}

  class RATE{
    static const YEAR=1;
    static const MONTH=2;
    static const DAY=3;
}