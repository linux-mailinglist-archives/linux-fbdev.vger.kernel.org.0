Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8C7545478
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Jun 2022 20:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235822AbiFISzp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Jun 2022 14:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234151AbiFISzo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Jun 2022 14:55:44 -0400
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439964F1EF
        for <linux-fbdev@vger.kernel.org>; Thu,  9 Jun 2022 11:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=jKbDcZ4FhDibO8JxQCv+QTocgVRW/U4XOgTC8XfUUug=;
        b=hB40xZ4hyPPam4Fq/YieoN0twbebpXGTVjxxVs1G+S+8a9iH9D8i0u3i+AMp8/RLibzAcma9Vlt7v
         VyO6DO4zilHHgBE2VUs2eADzCQ5C/q6dQqPCKNR4iCwX8ge4AdqSQkqi5sSjaapMCA7XLkmGPSY7sW
         epNdmDZ3KYvcvm5DO25vTWp9w/uRRpcYqwX12wYXCOO/IgXaIwiYYcPBqnB3nKlV9atmQM8kstFqwp
         tpSeGRj0hDrBQuiizXznNkHJ3TETssMxo//Rk6pbLM7V6caV93KqPdX/yHx3UQPQsKs8o1QtEqdWq7
         jjGblP9Qw5uY2Mg3/ncc6DnA2XjU0ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=jKbDcZ4FhDibO8JxQCv+QTocgVRW/U4XOgTC8XfUUug=;
        b=h+XYNB6d3kMH4x9JO6z2R7yz+scQXKcFoWGqN5h9JQ+W64bMGdDm5wYYLMKC72jEHdyxVuWYMau7f
         8sh55jeCA==
X-HalOne-Cookie: b7de46776df3454b5a3e685c6072709fa563f076
X-HalOne-ID: c0b9d5a1-e825-11ec-8231-d0431ea8bb10
Received: from mailproxy3.cst.dirpod4-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id c0b9d5a1-e825-11ec-8231-d0431ea8bb10;
        Thu, 09 Jun 2022 18:55:39 +0000 (UTC)
Date:   Thu, 9 Jun 2022 20:55:37 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fbdev: atmel_lcdfb: Rework backlight status updates
Message-ID: <YqJCKQmQEuVsbspK@ravnborg.org>
References: <20220609180440.3138625-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609180440.3138625-1-steve@sk2.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Stephen, thanks!
On Thu, Jun 09, 2022 at 08:04:40PM +0200, Stephen Kitt wrote:
> Instead of checking the state of various backlight_properties fields
> against the memorised state in atmel_lcdfb_info.bl_power,
> atmel_bl_update_status() should retrieve the desired state using
> backlight_get_brightness (which takes into account the power state,
> blanking etc.). This means the explicit checks using props.fb_blank
> and props.power can be dropped.
> 
> The backlight framework ensures that backlight is never negative, so
> the test before reading the brightness from the hardware always ends
> up false and the whole block can be removed. The framework retrieves
> the brightness from the hardware through atmel_bl_get_brightness()
> when necessary.
> 
> As a result, bl_power in struct atmel_lcdfb_info is no longer
> necessary, so remove that while we're at it. Since we only ever care
> about reading the current state in backlight_properties, drop the
> updates at the end of the function.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
