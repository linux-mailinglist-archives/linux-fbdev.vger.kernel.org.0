Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332B84B32C0
	for <lists+linux-fbdev@lfdr.de>; Sat, 12 Feb 2022 03:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbiBLCpU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 11 Feb 2022 21:45:20 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiBLCpU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 11 Feb 2022 21:45:20 -0500
X-Greylist: delayed 911 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Feb 2022 18:45:17 PST
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6652032065
        for <linux-fbdev@vger.kernel.org>; Fri, 11 Feb 2022 18:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:From:Subject; bh=hnD6/
        MAj8dW+YkPvw4z+qYD8VxUZ1mt7MjT1Dw6did4=; b=iD+2qv9JC7RSbzjac3GYo
        0wib5N9B6lJk8Rdf2OZXIxyIeJF6FZ7V9eW2oYHizfQN1Oalpb/f8/0ZI5JIQNXM
        +kmEsZegagb0Xh/0D5+vyjOB3uktQyz753hIf+5ysCMrmQvjffH3/k0amLnyRdtW
        iSjjLjpBdAN6IcPn5j4fRs=
Received: from [192.168.3.109] (unknown [218.201.129.19])
        by smtp7 (Coremail) with SMTP id C8CowAC37hqpGwdifV9fCg--.37742S2;
        Sat, 12 Feb 2022 10:30:02 +0800 (CST)
Message-ID: <11b64eb6-d0bb-6cfb-776f-5e6623dd984e@163.com>
Date:   Sat, 12 Feb 2022 10:29:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
From:   qianfan <qianfanguijin@163.com>
Subject: fbtft gpio backlight
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: C8CowAC37hqpGwdifV9fCg--.37742S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUoWlvUUUUU
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbB2AKl7WBHIrLMcgAAsb
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi:

fbtft_register_backlight assume backlight is off, get polarity from 
current state of pin. but the led gpio is requested by GPIOD_OUT_LOW 
flag, which means the gpio state when fbtft_register_backlight is always 
low.

Is it a bug?

Thanks

