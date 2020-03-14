Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D325185AF1
	for <lists+linux-fbdev@lfdr.de>; Sun, 15 Mar 2020 08:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgCOHPk (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 15 Mar 2020 03:15:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49192 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727837AbgCOHPj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 15 Mar 2020 03:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=NHeryp73ctRAoZbPn/vDZfR166VOTFwfd8iU0fyHgbs=; b=uATsIQ1oOi3gnnrYhS7KevWS1W
        taK1U+4e7HMCn4TxngzRdh9AAqTUG9UAsDzr0KgMMSi3eWpBZGIwvgOK5XuuwLw7l2CoJsHA4t25q
        GA6+oFdNPb7PNwxKnMJR3vCC1v69xBuHSgUlZUhb4qUZS0HWIkD29L7Nrfc4ewMbNke/64sUTRPD5
        JB0sJVp32ooBl08FAoVU7LNQBAdZeoQgnS+BLZlhbWMFXub5jYKpoVnsuTCE93Tt0mYVcdAvjSeTy
        n8z1MjZsTKjEzTVXyapW0/O8W+k5z8ZYpn4VxltKPXOvy4wJgSjyarSq9fX4MMRjZ31dOaDE74lxU
        ELx1pZJg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jD1KH-00026n-Up; Sat, 14 Mar 2020 07:35:18 +0000
To:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: pm3fb.c: question
Message-ID: <9f7b3b9b-f48e-6da1-d08c-cc60f60b1eac@infradead.org>
Date:   Sat, 14 Mar 2020 00:35:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

In drivers/video/fbdev/pm3fb.c, if I change the definition of DPRINTK()
(in order to remove some gcc warnings if -Wextra is used), like this:

-#define DPRINTK(a, b...)
+#define DPRINTK(a, b...)	no_printk(a, ##b)

I get a build error here:
		default:
			DPRINTK("Unsupported depth %d\n",
				info->current_par->depth);
			break;

../drivers/video/fbdev/pm3fb.c: In function ‘pm3fb_init_engine’:
../drivers/video/fbdev/pm3fb.c:353:9: error: ‘struct fb_info’ has no member named ‘current_par’
     info->current_par->depth);
         ^

Is there a replacement (fix) for this field?
or should the entire DPRINTK() be deleted?
or somethine else?

thanks.
-- 
~Randy

