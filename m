Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6631D7AC475
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 Sep 2023 20:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjIWShz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 23 Sep 2023 14:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjIWShy (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 23 Sep 2023 14:37:54 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE32F113;
        Sat, 23 Sep 2023 11:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1695494237; x=1696099037; i=deller@gmx.de;
 bh=6ODb61JZKAyoefAj0bLEfwWKHG7W2MnMV+6ga2PGkLo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=el/ZYIcCuQHsxYgCfA30NsBJ/8n1wNnERA/R3g3ZoDDCcxIloMgtH9hao72xXbu4c4g92kpijpv
 VtBDYO3drcnNdv6X/AA/1dN3KaxaelfY4xouhW8Nz1dfkruSHTJXgBmNiPEy7rRbRHUHsz4FfJfYC
 Wo+UF8a5Iet0sSWOSBV0FeCp0X9K6qeWd0KQkR2ktbHtganYtz7suqRs7A/YvmQRiKkdM7Rw0Fr8g
 AbQPjPmMuKvWCS/icrJ20DEu27drA00OaH6DhYKhL2GJR+7JVSPvIW3T3FezA3gM3OJsOxvnOIk5n
 KyxudvdIWOcgSChaSACE5mE9hTcSi8WI3CuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.25]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOiHl-1r23r02Rvr-00Q8cc; Sat, 23
 Sep 2023 20:37:17 +0200
Message-ID: <4eccc506-4ff1-6890-8f1a-a5f267dfa5ea@gmx.de>
Date:   Sat, 23 Sep 2023 20:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] video: fbdev: mmp: Annotate struct mmphw_ctrl with
 __counted_by
Content-Language: en-US
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230922175137.work.062-kees@kernel.org>
 <6dae12b4-125c-a7be-4129-75065f7a5128@embeddedor.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <6dae12b4-125c-a7be-4129-75065f7a5128@embeddedor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yedBhjjM8NxVuspZ3zErQHUL9LZ3Vf0+5s1SQjPq3DIPw6TJhiC
 osQATF9/F+uYJv+BHg/bbTPVAG1LGxO+d6yPczJjUr5oxU5nSng8K7yvKR5de14V1RsdcVY
 2qV/2MyouEWEvWrawP/5/UbIUKVt/oATUsHVUR4CrPS6rIcvrHgeoG8FJqtlhv2tVB4cyTW
 jI0doyh2nzH0wqe0VwFog==
UI-OutboundReport: notjunk:1;M01:P0:TRvVQzlGCos=;7gzqbw5vb4X85Go95YFUxHL4cLC
 f40zMWnupAvDHowlAlwfKtSVbKXMw37F/Db0xIiuFWYSaQVLNyCOUyO/SIVLYMDRXUx73wesn
 wjDlum2ZkJKUW1RMGjpkwi76akgZ3066ZVUFU31KLfCDOoTDI/bPqXSVhHhTuzy9feNQ457lJ
 r9E5haNbsLolJ3istYWVpB8QHWoIKctEuAMtZPvAU76b3SboIleAItIgw1GmVpnLtcqe5AmUL
 gLbVjoh5to16HedGADpgcooFKX9usURVzIqaksCBCb77pl3AkkKTKvWgaEnNQNybGNRxZWyDl
 vNI+b7VyWKHdC3rqz6qYumOIWtsY7EU5JtXDqykLXyKqSFGgB57O8tY4JaSRELFvoYNaKbxGF
 0Qdx/HngSyboOfGQF5bJTG45MlR3kOHaNlRHL51G3HaubKnCgnhH1AiP2c8IBh9H3QdIJVji8
 xXzHWsWsiyJY37tuZrgLHv4mjcxl5SZcgLwEHtorIzZVPJI+KJEckpNfkBOwlhOXA9LVwChcI
 4xzFvlEOHGAL4DRkVgdNS5mo2EJYBNuTTvdL9mofHnV0RinTLucZPQ7KlLgrTmc1YFAVv5LCT
 2Y2nmgHfb71zrQUu8uFb5cj6RuHoMSd/zeiGOOsCur0UWE/dHaMqnrs9sQg9ktpwA79FxDaXO
 YtBgxPPEA5jarLsXD7TGKQ9AASzkpYpTf0PacPdXRM4UbJ8IVI2x1dj9u6jVh7ON83atK7dXr
 fh+WnFiod5rnwdjGs6sHENWod0SQW3YLKzmXx4sRU5M28LSWFXptykzRobxUARh04UH7KFbcW
 OCAzQo47g7aSIZMcniErJbiRVjQmGW/jSr/Yds5gl5tW0tgFL+ak55nfQ9oHsyRkwEwBUcrIZ
 3WBNXzFYGMNR/p78liQwldZsbjFiTwMJsjad4ecD+OLhTmSoz8qAlARmDLfRs46zSmFtgXcb8
 KtvhQQ==
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 9/23/23 18:33, Gustavo A. R. Silva wrote:
> On 9/22/23 11:51, Kees Cook wrote:
>> Prepare for the coming implementation by GCC and Clang of the __counted=
_by
>> attribute. Flexible array members annotated with __counted_by can have
>> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOU=
NDS
>> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-famil=
y
>> functions).
>>
>> As found with Coccinelle[1], add __counted_by for struct mmphw_ctrl.
>>
>> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples=
/counted_by.cocci
>>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Both fbdev patches applied to fbdev git tree.

Thank you Kees!

Helge
