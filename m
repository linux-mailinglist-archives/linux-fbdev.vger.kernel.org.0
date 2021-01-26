Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1403303791
	for <lists+linux-fbdev@lfdr.de>; Tue, 26 Jan 2021 09:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbhAZH6r (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 26 Jan 2021 02:58:47 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:55330 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730753AbhAZH4I (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 26 Jan 2021 02:56:08 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10Q7sWnZ142151;
        Tue, 26 Jan 2021 07:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=8ukOlP69r9StlhSqY+DgMD3BvlxzZWEEv5lcyj86YWo=;
 b=JHTedNTCH08nPA1VfT+fj0pa9paDWB4Zl+yPmlSn+GK+6FPIIX94Nkrs/xxrjW6hYeQK
 A6pTZJ1UIoGA/4GF2wE5ysZ0Vj0SP4qRAlZpRlVM2U6RTfDiKpZA3SJQZPEFoxrZNGzy
 m8n7sjyZkbaAihgU3ehDniBNl1QmKlAZQ3TFfSoUKJDwhGyxZtlvSz1Yhpdc0mIq2PAU
 DEb3EvcRpqMND7BC3vsU7EcLt3b3q5tc+xsHjO4FjlpAqVlxAXCfDxV1qM8lsv6mezXp
 23tC0FEHGpu/EgqHlHZ01Pu5lNoEBl6YzVgWYuaRRNEC9FLvtOfKVatHNeKI2n1J7u4q rw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 368brkgse8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 07:55:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10Q7pXjX004836;
        Tue, 26 Jan 2021 07:54:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 368wjqtrf1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 07:54:59 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10Q7soMP031763;
        Tue, 26 Jan 2021 07:54:51 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 25 Jan 2021 23:54:50 -0800
Date:   Tue, 26 Jan 2021 10:54:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Carlis <zhangxuezhi3@gmail.com>
Cc:     gregkh@linuxfoundation.org, devel@driverdev.osuosl.org,
        linux-fbdev@vger.kernel.org, mh12gx2825@gmail.com,
        oliver.graute@kococonnector.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, sbrivio@redhat.com,
        colin.king@canonical.com, zhangxuezhi1@yulong.com
Subject: Re: [PATCH] fbtft: add tearing signal detect
Message-ID: <20210126075441.GW2696@kadam>
References: <1611502537-80668-1-git-send-email-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611502537-80668-1-git-send-email-zhangxuezhi3@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260041
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260041
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Sun, Jan 24, 2021 at 11:35:37PM +0800, Carlis wrote:
> +static irqreturn_t spi_panel_te_handler(int irq, void *data)
> +{
> +	complete(&spi_panel_te);
> +	return IRQ_HANDLED;
> +}
> +
> +static void enable_spi_panel_te_irq(struct fbtft_par *par, bool enable)

It quite confused me that enable actually disables.  I always feel like
it's clearer to write these as two separate functions.

> +{
> +	static int te_irq_count;
> +
> +	if (!par->gpio.te) {

This is always checked in the caller.  And it's when it's NULL that
means it's deliberate so don't print a message.

> +		pr_err("%s:%d,SPI panel TE GPIO not configured\n",
> +		       __func__, __LINE__);
> +		return;
> +	}
> +
> +	mutex_lock(&te_mutex);
> +
> +	if (enable) {
> +		if (++te_irq_count == 1)
> +			enable_irq(gpiod_to_irq(par->gpio.te));
> +	} else {
> +		if (--te_irq_count == 0)
> +			disable_irq(gpiod_to_irq(par->gpio.te));
> +	}
> +	mutex_unlock(&te_mutex);
> +}
> +
>  /**
>   * init_display() - initialize the display controller
>   *
> @@ -82,6 +117,28 @@ enum st7789v_command {
>   */
>  static int init_display(struct fbtft_par *par)
>  {
> +	int rc;
> +	struct device *dev = par->info->device;
> +
> +	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
> +	if (par->gpio.te) {

devm_gpiod_get_index_optional() can return NULL or error pointers.  If
it returns NULL then don't print an error message.  NULL reports are
deliberate.

	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
	if (IS_ERR(par->gpio.te)) {
		pr_err("%s:%d, TE gpio not specified\n", __func__, __LINE__);
		return PTR_ERR(par->gpio.te);
	}

	if (par->gpio.te) {


> +		init_completion(&spi_panel_te);
> +		mutex_init(&te_mutex);
> +		rc = devm_request_irq(dev,
> +				      gpiod_to_irq(par->gpio.te),
> +				     spi_panel_te_handler, IRQF_TRIGGER_RISING,
> +				     "TE_GPIO", par);
> +		if (rc) {
> +			pr_err("TE request_irq failed.\n");
> +			par->gpio.te = NULL;
> +		} else {
> +			disable_irq_nosync(gpiod_to_irq(par->gpio.te));
> +			pr_err("TE request_irq completion.\n");

Why is this printing an error message if devm_request_irq() succeeds?

> +		}
> +	} else {
> +		pr_err("%s:%d, TE gpio not specified\n",
> +		       __func__, __LINE__);
> +	}
>  	/* turn off sleep mode */
>  	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
>  	mdelay(120);
> @@ -137,6 +194,9 @@ static int init_display(struct fbtft_par *par)
>  	 */
>  	write_reg(par, PWCTRL1, 0xA4, 0xA1);
>  
> +    /*Tearing Effect Line On*/
> +	if (par->gpio.te)
> +		write_reg(par, 0x35, 0x00);
>  	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
>  
>  	if (HSD20_IPS)
> @@ -145,6 +205,76 @@ static int init_display(struct fbtft_par *par)
>  	return 0;
>  }
>  
> +/*****************************************************************************
> + *
> + *   int (*write_vmem)(struct fbtft_par *par);
> + *
> + *****************************************************************************/
> +
> +/* 16 bit pixel over 8-bit databus */
> +int st7789v_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
> +{
> +	u16 *vmem16;
> +	__be16 *txbuf16 = par->txbuf.buf;
> +	size_t remain;
> +	size_t to_copy;
> +	size_t tx_array_size;
> +	int i;
> +	int rc, ret = 0;

Delete one of these "rc" or "rec" variables.

> +	size_t startbyte_size = 0;
> +
> +	fbtft_par_dbg(DEBUG_WRITE_VMEM, par, "st7789v ---%s(offset=%zu, len=%zu)\n",
> +		      __func__, offset, len);
> +
> +	remain = len / 2;
> +	vmem16 = (u16 *)(par->info->screen_buffer + offset);
> +
> +	if (par->gpio.dc)
> +		gpiod_set_value(par->gpio.dc, 1);
> +
> +	/* non buffered write */
> +	if (!par->txbuf.buf)
> +		return par->fbtftops.write(par, vmem16, len);
> +
> +	/* buffered write */
> +	tx_array_size = par->txbuf.len / 2;
> +
> +	if (par->startbyte) {
> +		txbuf16 = par->txbuf.buf + 1;
> +		tx_array_size -= 2;
> +		*(u8 *)(par->txbuf.buf) = par->startbyte | 0x2;
> +		startbyte_size = 1;
> +	}
> +
> +	while (remain) {
> +		to_copy = min(tx_array_size, remain);
> +		dev_dbg(par->info->device, "    to_copy=%zu, remain=%zu\n",
> +			to_copy, remain - to_copy);
> +
> +		for (i = 0; i < to_copy; i++)
> +			txbuf16[i] = cpu_to_be16(vmem16[i]);
> +
> +		vmem16 = vmem16 + to_copy;
> +		if (par->gpio.te) {
> +			enable_spi_panel_te_irq(par, true);
> +			reinit_completion(&spi_panel_te);
> +			rc = wait_for_completion_timeout(&spi_panel_te,
> +							 msecs_to_jiffies(SPI_PANEL_TE_TIMEOUT));
> +			if (rc == 0)
> +				pr_err("wait panel TE time out\n");
> +		}
> +		ret = par->fbtftops.write(par, par->txbuf.buf,
> +								startbyte_size + to_copy * 2);

Line break is whacky.

> +		if (par->gpio.te)
> +			enable_spi_panel_te_irq(par, false);
> +		if (ret < 0)
> +			return ret;
> +		remain -= to_copy;
> +	}
> +
> +	return ret;

Shouldn't this be "return len;" or something?

> +}
> +

regards,
dan carpenter

